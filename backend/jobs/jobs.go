package jobs

import (
	"github.com/wakamenod/suito/client"
	"gorm.io/gorm"
)

func ScheduleAllJobs(authClient client.AuthClient, db *gorm.DB) error {
	if err := scheduleDeleteUserJob(authClient, db); err != nil {
		return err
	}
	if err := scheduleCreateTransactionsJob(db); err != nil {
		return err
	}
	return nil
}
