package server

import (
	"context"
	"fmt"
	"time"

	firebase "firebase.google.com/go/v4"
	"firebase.google.com/go/v4/auth"
	"github.com/labstack/echo/v4"
	"github.com/spf13/viper"
	"github.com/wakamenod/suito/api"
	"github.com/wakamenod/suito/env"
	"github.com/wakamenod/suito/log"
	"github.com/wakamenod/suito/middleware"
)

type (
	Server struct {
		e       *echo.Echo
		address string
	}
)

func New() Server {
	e := echo.New()
	e.HideBanner = true
	e.HidePort = true
	e.Debug = env.DEBUG
	e.Logger = log.NewEchoLogger()
	e.Server.ReadTimeout = 5 * time.Second
	e.Server.ReadHeaderTimeout = 10 * time.Second
	e.Server.WriteTimeout = 5 * time.Second
	e.Server.IdleTimeout = 120 * time.Second

	e.Use(middleware.VerifyIDTokenMiddleware(firebaseAuthClient()))

	return Server{e: e, address: GetServerAddress()}
}

func firebaseAuthClient() *auth.Client {
	ctx := context.Background()
	app, err := firebase.NewApp(ctx, nil)
	if err != nil {
		log.Fatal("error initializing Firebase App", log.Fields{"err": err})
	}
	client, err := app.Auth(ctx)
	if err != nil {
		log.Fatal("error getting Firebase Auth client", log.Fields{"err": err})
	}
	return client
}

func GetServerAddress() string {
	host := viper.GetString("server.host")
	port := viper.GetInt("server.port")
	return fmt.Sprintf("%s:%d", host, port)
}

func (s *Server) Start() {
	log.Info("start suito server", log.Fields{
		"address": s.address,
		"ver":     viper.GetString("server.ver"),
	})

	s.e = api.InitRoute(s.e)

	go func() {
		if err := s.e.Start(s.address); err != nil {
			log.Info("shutting down suito api server", nil)
		}
	}()
}

func (s *Server) Stop() error {
	ctx, cancel := context.WithTimeout(context.Background(), 30*time.Second)
	defer cancel()
	return s.e.Shutdown(ctx)
}
