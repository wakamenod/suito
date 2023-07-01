package jobs

import (
	"time"

	"github.com/go-co-op/gocron"
	"github.com/pkg/errors"
	"github.com/wakamenod/suito/api/services"
	"github.com/wakamenod/suito/log"
)

var (
	jst = time.FixedZone("Asia/Tokyo", 9*60*60)
)

type (
	deleteUserJob struct {
		service *services.SuitoDeleteUserJobService
	}
)

func newDeleteUserJob(service *services.SuitoDeleteUserJobService) *deleteUserJob {
	return &deleteUserJob{service: service}
}

func (j *deleteUserJob) do() {
	log.Info("=== start deleteUserJob ===", nil)
	defer log.Info("=== end deleteUserJob ===", nil)

	err := j.service.DeleteUsersJobService()
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

func scheduleDeleteUserJob(service *services.SuitoDeleteUserJobService) error {
	job := newDeleteUserJob(service)
	return scheduleDeleteUserWithJob(job)
}
