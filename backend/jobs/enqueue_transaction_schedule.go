package jobs

import (
	"github.com/go-co-op/gocron"
	"github.com/pkg/errors"
	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/api/services"
	"github.com/wakamenod/suito/log"
	"gorm.io/gorm"
)

type (
	enqueueTransactionScheduleJob struct {
		repo *repositories.SuitoRepository
	}
)

func newEnqueueTransactionScheduleJob(repo *repositories.SuitoRepository) *enqueueTransactionScheduleJob {
	return &enqueueTransactionScheduleJob{repo: repo}
}

func (j *enqueueTransactionScheduleJob) do() {
	log.Info("=== start enqueueTransactionScheduleJob ===", nil)
	defer log.Info("=== end enqueueTransactionScheduleJob ===", nil)

	err := services.NewSuitoJobService(j.repo, nil).EnqueueTransactionSchedulesService()
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

func scheduleEnqueueTransactionScheduleJob(db *gorm.DB) error {
	job := newEnqueueTransactionScheduleJob(repositories.NewSuitoRepository(db))
	return scheduleEnqueueTransactionScheduleWithJob(job)
}
