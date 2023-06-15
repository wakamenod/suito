package jobs

import (
	"context"
	"fmt"
	"time"

	"google.golang.org/api/iterator"
	"gorm.io/gorm"

	"github.com/go-co-op/gocron"
	"github.com/pkg/errors"
	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/client"
	"github.com/wakamenod/suito/log"
)

var (
	jst = time.FixedZone("Asia/Tokyo", 9*60*60)
)

type (
	deleteUserJob struct {
		authClient client.AuthClient
		repo       *repositories.SuitoRepository
	}
)

func newDeleteUserJob(client client.AuthClient, repo *repositories.SuitoRepository) *deleteUserJob {
	return &deleteUserJob{authClient: client, repo: repo}
}

// TODO サービスに移動?
func (j *deleteUserJob) do() {
	log.Info("=== start deleteUserJob ===", nil)
	defer log.Info("=== end deleteUserJob ===", nil)

	firebaseUsers, err := j.fetchFirebaseUsers()
	if err != nil {
		log.Warn("err fetchFirebaseUsers", log.Fields{"err": err})
	}
	uids, err := j.repo.FindAllUIDs()
	if err != nil {
		log.Warn("err FindAllUIDs", log.Fields{"err": err})
		return
	}

	nonExistentUIDs := getNonExistentUsersIDs(uids, firebaseUsers)

	log.Info("delete user targets", log.Fields{"uids": nonExistentUIDs})
	if err := j.deleteAllUserData(nonExistentUIDs); err != nil {
		log.Warn("err deleteAllUserData", log.Fields{"err": err})
	}
}

func getNonExistentUsersIDs(uuids []string, firebaseUsers map[string]bool) []string {
	nonExistentUsers := make([]string, 0)
	for _, uuid := range uuids {
		if _, ok := firebaseUsers[uuid]; !ok {
			nonExistentUsers = append(nonExistentUsers, uuid)
		}
	}
	return nonExistentUsers
}

// firebase登録済みのユーザーIDをマップのキーとして返却
func (j *deleteUserJob) fetchFirebaseUsers() (map[string]bool, error) {
	ctx := context.Background()
	userIDs := make(map[string]bool)

	iter := j.authClient.Users(ctx, "")
	for {
		user, err := iter.Next()
		if err == iterator.Done {
			break
		}
		if err != nil {
			return nil, errors.Wrap(err, "error listing users")
		}

		userIDs[user.UID] = true
	}

	return userIDs, nil
}

func (j *deleteUserJob) deleteAllUserData(uids []string) error {
	for _, uid := range uids {
		err := j.repo.Transaction(func(tx *gorm.DB) error {
			if err := j.repo.HardDeleteAllUserExpenseCategories(uid); err != nil {
				return err
			}
			if err := j.repo.HardDeleteAllUserExpenseLocations(uid); err != nil {
				return err
			}
			if err := j.repo.HardDeleteAllUserExpenses(uid); err != nil {
				return err
			}
			if err := j.repo.HardDeleteAllUserIncomes(uid); err != nil {
				return err
			}
			return nil
		})
		if err != nil {
			return errors.Wrap(err, fmt.Sprintf("err deleteAllUserData uid=%s\n", uid))
		}
	}

	return nil
}

func scheduleDeleteUserWithJob(job *deleteUserJob) error {
	s := gocron.NewScheduler(jst)

	j, err := s.Every(1).Hour().Do(job.do)
	if err != nil {
		return errors.Wrap(err, "failed to setup delete user job")
	}
	log.Info("delete user job scheduled", log.Fields{
		"ScheduledAtTime": j.ScheduledAtTime(),
	})
	s.StartAsync()

	return nil
}

func scheduleDeleteUserJob(authClient client.AuthClient, db *gorm.DB) error {
	job := newDeleteUserJob(authClient, repositories.NewSuitoRepository(db))
	return scheduleDeleteUserWithJob(job)
}
