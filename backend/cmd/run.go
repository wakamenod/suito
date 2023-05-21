package cmd

import (
	"fmt"
	"os"
	"os/signal"

	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"github.com/wakamenod/suito/env"
	"github.com/wakamenod/suito/log"
	"github.com/wakamenod/suito/server"
)

func startWeb() error {
	server := server.New()
	server.Start()

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
	outPath := viper.GetString("log.log")
	errPath := viper.GetString("log.err_log")
	level := viper.GetString("log.level")
	c := log.LogConfig{
		OutPath: outPath,
		ErrPath: errPath,
		Level:   level,
	}
	if err := log.Init(c); err != nil {
		panic(err)
	}
}
