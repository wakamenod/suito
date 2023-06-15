package server

import (
	"context"
	"fmt"
	"time"

	"github.com/labstack/echo/v4"

	emiddleware "github.com/labstack/echo/v4/middleware"
	"github.com/spf13/viper"
	"github.com/wakamenod/suito/api"
	"github.com/wakamenod/suito/api/repositories"
	"github.com/wakamenod/suito/apperrors"
	"github.com/wakamenod/suito/client"
	"github.com/wakamenod/suito/env"
	"github.com/wakamenod/suito/log"
	"github.com/wakamenod/suito/middleware"
	"github.com/wakamenod/suito/validate"
	"gorm.io/gorm"
)

type (
	Server struct {
		e       *echo.Echo
		address string
	}
)

func New(authClient client.AuthClient, db *gorm.DB) Server {
	e := echo.New()
	e.HideBanner = true
	e.HidePort = true
	e.Debug = env.DEBUG
	e.Logger = log.NewEchoLogger()
	e.Server.ReadTimeout = 5 * time.Second
	e.Server.ReadHeaderTimeout = 10 * time.Second
	e.Server.WriteTimeout = 5 * time.Second
	e.Server.IdleTimeout = 120 * time.Second
	e.Validator = validate.NewValidator()
	e.HTTPErrorHandler = apperrors.HTTPErrorHandler

	e.Use(middleware.VerifyIDTokenMiddleware(authClient, repositories.NewSuitoRepository(db)))
	e.Use(middleware.Logger())
	e.Use(emiddleware.BodyDump(func(c echo.Context, reqBody, resBody []byte) {
		c.Set(middleware.ReqBodyLogKey, string(reqBody))
		c.Set(middleware.ResBodyLogKey, string(resBody))
	}))

	return Server{e: e, address: GetServerAddress()}
}

func GetServerAddress() string {
	host := viper.GetString("server.host")
	port := viper.GetInt("server.port")
	return fmt.Sprintf("%s:%d", host, port)
}

func (s *Server) Start(db *gorm.DB) {
	log.Info("start suito server", log.Fields{
		"address": s.address,
		"ver":     viper.GetString("server.ver"),
	})

	s.e = api.InitRoute(s.e, db)

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
