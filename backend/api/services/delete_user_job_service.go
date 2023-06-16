package services

import (
	"context"
	"fmt"

	"github.com/pkg/errors"
	"github.com/wakamenod/suito/api/services/repositories"
	"github.com/wakamenod/suito/client"
	"github.com/wakamenod/suito/log"
	"google.golang.org/api/iterator"
)

func (s *SuitoJobService) DeleteUsersJobService() error {
	firebaseUsers, err := fetchFirebaseUsers(s.authClient)
	if err != nil {
		log.Warn("err fetchFirebaseUsers", log.Fields{"err": err})
		return errors.Wrap(err, "err fetchFirebaseUsers")
	}
	uids, err := s.repo.FindAllUIDs()
	if err != nil {
		return errors.Wrap(err, "err FindAllUIDs")
	}

	nonExistentUIDs := getNonExistentUsersIDs(uids, firebaseUsers)

	log.Info("delete user targets", log.Fields{"uids": nonExistentUIDs})
	if err := deleteAllUserData(s.repo, nonExistentUIDs); err != nil {
		log.Warn("err deleteAllUserData", log.Fields{"err": err})
	}

	return nil
}

func deleteAllUserData(repo repositories.Repository, uids []string) error {
	for _, uid := range uids {
		err := repo.Transaction(func(txRepo repositories.Repository) error {
			if err := txRepo.HardDeleteAllUserExpenseCategories(uid); err != nil {
				return err
			}
			if err := txRepo.HardDeleteAllUserExpenseLocations(uid); err != nil {
				return err
			}
			if err := txRepo.HardDeleteAllUserExpenses(uid); err != nil {
				return err
			}
			if err := txRepo.HardDeleteAllUserIncomes(uid); err != nil {
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
func fetchFirebaseUsers(authClient client.AuthClient) (map[string]bool, error) {
	ctx := context.Background()
	userIDs := make(map[string]bool)

	iter := authClient.Users(ctx, "")
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
