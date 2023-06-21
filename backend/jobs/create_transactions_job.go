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
	createTransactionsJob struct {
		repo *repositories.SuitoRepository
	}
)

func newCreateTransactionsJob(repo *repositories.SuitoRepository) *createTransactionsJob {
	return &createTransactionsJob{repo: repo}
}

func (j *createTransactionsJob) do() {
	log.Info("=== start createTransactionsJob ===", nil)
	defer log.Info("=== end createTransactionsJob ===", nil)

	err := services.NewSuitoJobService(j.repo, nil).CreateTransactionsService()
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

func scheduleCreateTransactionsJob(db *gorm.DB) error {
	job := newCreateTransactionsJob(repositories.NewSuitoRepository(db))
	return scheduleCreateTransactionsWithJob(job)
}
