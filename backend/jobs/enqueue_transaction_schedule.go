package jobs

import (
	"github.com/go-co-op/gocron"
	"github.com/pkg/errors"
	"github.com/wakamenod/suito/api/services"
	"github.com/wakamenod/suito/log"
)

type (
	enqueueTransactionScheduleJob struct {
		service *services.SuitoScheduleJobService
	}
)

func newEnqueueTransactionScheduleJob(service *services.SuitoScheduleJobService) *enqueueTransactionScheduleJob {
	return &enqueueTransactionScheduleJob{service: service}
}

func (j *enqueueTransactionScheduleJob) do() {
	log.Info("=== start enqueueTransactionScheduleJob ===", nil)
	defer log.Info("=== end enqueueTransactionScheduleJob ===", nil)

	err := j.service.EnqueueTransactionSchedulesService()
	if err != nil {
		log.Warn("err EnqueueTransactionSchedulesJobService", log.Fields{"err": err})
	}
}

func scheduleEnqueueTransactionScheduleWithJob(job *enqueueTransactionScheduleJob) error {
	s := gocron.NewScheduler(jst)

	j, err := s.Cron("45 * * * *").Do(job.do)
	if err != nil {
		return errors.Wrap(err, "failed to setup create transactions job")
	}
	log.Info("create transactions job scheduled", log.Fields{
		"ScheduledAtTime": j.ScheduledAtTime(),
	})
	s.StartAsync()

	return nil
}

func scheduleEnqueueTransactionScheduleJob(service *services.SuitoScheduleJobService) error {
	job := newEnqueueTransactionScheduleJob(service)
	return scheduleEnqueueTransactionScheduleWithJob(job)
}
