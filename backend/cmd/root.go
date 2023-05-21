package cmd

import (
	"fmt"
	"os"
	"strings"

	"github.com/pkg/errors"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
	"github.com/wakamenod/suito/env"
	"github.com/wakamenod/suito/log"
)

var cfgFile string

var rootCmd = &cobra.Command{
	Use:     "suito",
	Version: env.Version,
	Short:   fmt.Sprintf("%s suito", env.Name),
}

func Execute() {
	log.Debug("Suito API Server", log.Fields{"start": env.CommitHash})
	if err := rootCmd.Execute(); err != nil {
		log.Info("err", log.Fields{"err": err})
		os.Exit(1)
	}
}

func init() {
	cobra.OnInitialize(initConfig)
	if env.DEBUG {
		rootCmd.PersistentFlags().StringVar(&cfgFile, "config", "config/config.debug.toml", "config file")
	} else {
		rootCmd.PersistentFlags().StringVar(&cfgFile, "config", "config/config.toml", "config file")
	}
	rootCmd.Flags().BoolP("toggle", "t", false, "help message for toggle")
}

func initConfig() {
	if cfgFile != "" {
		viper.SetConfigFile(cfgFile)
	} else {
		if env.DEBUG {
			viper.SetConfigFile("config/config.debug.toml")
		} else {
			viper.SetConfigFile("config/config.toml")
		}
	}
	viper.SetEnvKeyReplacer(strings.NewReplacer(".", "_", "-", "_"))
	viper.AutomaticEnv()
	if err := viper.ReadInConfig(); err != nil {
		log.Fatal(errors.Wrap(err, "config read error"), nil)
		return
	}
}
