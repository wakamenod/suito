package server_test

import (
	"net/http"

	"testing"

	"github.com/spf13/viper"
	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/integrationtest"
	"github.com/wakamenod/suito/log"
	"github.com/wakamenod/suito/server"
)

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

func setup() {
	viper.SetDefault("server.host", "localhost")
	viper.SetDefault("server.port", "8009")
	viper.SetDefault("log.log", "stdout")
	viper.SetDefault("log.err_log", "stderr")
	viper.SetDefault("log.ltsv_log", "stdout")
	initLogger()
}

func teardown() {
	// fmt.Println("teardown")
}

func TestMain(m *testing.M) {
	setup()
	m.Run()
	teardown()
}

func TestServer_Start(t *testing.T) {
	integrationtest.SkipIfShort(t)

	t.Run("starts the server and listens for requests", func(t *testing.T) {
		cleanup := integrationtest.CreateServer(t)
		defer cleanup()

		resp, err := http.Get("http://" + server.GetServerAddress() + "/")
		require.NoError(t, err)
		defer resp.Body.Close()
		require.Equal(t, http.StatusNotFound, resp.StatusCode)
	})
}
