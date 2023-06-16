package cmd

import (
	"fmt"
	"os"
	"os/signal"

	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"github.com/wakamenod/suito/client"
	"github.com/wakamenod/suito/db"
	"github.com/wakamenod/suito/env"
	"github.com/wakamenod/suito/jobs"
	"github.com/wakamenod/suito/log"
	"github.com/wakamenod/suito/server"
)

func startWeb() error {
	authClient := client.NewFirebaseAuthClient()

	db := db.OpenDB()
	if err := jobs.ScheduleAllJobs(authClient, db); err != nil {
		return err
	}

	server := server.New(authClient, db)
	server.Start(db)

	quit := make(chan os.Signal, 1)
	signal.Notify(quit, os.Interrupt)
	<-quit
	return server.Stop()
}

// runCmd represents the run command
var runCmd = &cobra.Command{
	Use:   "run",
	Short: fmt.Sprintf("Start %s server", env.Name),
	Long:  ``,
	Run: func(cmd *cobra.Command, args []string) {
		if err := startWeb(); err != nil {
			log.Fatal(err, nil)
		}
	},
}

func init() {
	rootCmd.AddCommand(runCmd)
	viper.SetDefault("server.port", "8009")
	viper.SetDefault("server.host", "localhost")
	viper.SetDefault("log.log", "stdout")
	viper.SetDefault("log.err_log", "stderr")
	viper.SetDefault("log.ltsv_log", "stdout")
	initLogger()
}

func initLogger() {
	if err := log.Init(); err != nil {
		panic(err)
	}
}
