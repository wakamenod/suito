package jobs

import (
	"github.com/go-co-op/gocron"
	"github.com/pkg/errors"
	"github.com/wakamenod/suito/api/services"
	"github.com/wakamenod/suito/log"
)

type (
	createTransactionsJob struct {
		service *services.SuitoScheduleJobService
	}
)

func newCreateTransactionsJob(service *services.SuitoScheduleJobService) *createTransactionsJob {
	return &createTransactionsJob{service: service}
}

func (j *createTransactionsJob) do() {
	log.Info("=== start createTransactionsJob ===", nil)
	defer log.Info("=== end createTransactionsJob ===", nil)

	err := j.service.CreateTransactionsService()
	if err != nil {
		log.Warn("err CreateTransactionssJobService", log.Fields{"err": err})
	}
}

func scheduleCreateTransactionsWithJob(job *createTransactionsJob) error {
	s := gocron.NewScheduler(jst)

	j, err := s.Cron("15 * * * *").Do(job.do)
	if err != nil {
		return errors.Wrap(err, "failed to setup create transactions job")
	}
	log.Info("create transactions job scheduled", log.Fields{
		"ScheduledAtTime": j.ScheduledAtTime(),
	})
	s.StartAsync()

	return nil
}

func scheduleCreateTransactionsJob(service *services.SuitoScheduleJobService) error {
	job := newCreateTransactionsJob(service)
	return scheduleCreateTransactionsWithJob(job)
}
