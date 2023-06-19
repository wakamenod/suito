package jobs

import (
	"time"

	"gorm.io/gorm"

	"github.com/go-co-op/gocron"
	"github.com/pkg/errors"
	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/api/services"
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

func (j *deleteUserJob) do() {
	log.Info("=== start deleteUserJob ===", nil)
	defer log.Info("=== end deleteUserJob ===", nil)

	err := services.NewSuitoJobService(j.repo, j.authClient).DeleteUsersJobService()
	if err != nil {
		log.Warn("err DeleteUsersJobService", log.Fields{"err": err})
	}
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
