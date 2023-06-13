package server

import (
	"context"
	"fmt"
	"os"
	"time"

	firebase "firebase.google.com/go/v4"
	"firebase.google.com/go/v4/auth"
	"github.com/labstack/echo/v4"

	emiddleware "github.com/labstack/echo/v4/middleware"
	"github.com/spf13/viper"
	"github.com/wakamenod/suito/api"
	"github.com/wakamenod/suito/apperrors"
	"github.com/wakamenod/suito/env"
	"github.com/wakamenod/suito/log"
	"github.com/wakamenod/suito/middleware"
	"github.com/wakamenod/suito/validate"
	"go.uber.org/zap"
	"golang.org/x/crypto/acme/autocert"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	gormlogger "gorm.io/gorm/logger"
	"moul.io/zapgorm2"
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
	e.Validator = validate.NewValidator()
	e.HTTPErrorHandler = apperrors.HTTPErrorHandler

	if !env.DEBUG {
		e.Pre(emiddleware.HTTPSRedirect())
		e.AutoTLSManager.HostPolicy = autocert.HostWhitelist(os.Getenv("APP_HOST"))
		e.AutoTLSManager.Cache = autocert.DirCache("/var/www/certs")
	}

	e.Use(middleware.VerifyIDTokenMiddleware(firebaseAuthClient()))
	e.Use(middleware.Logger())
	e.Use(emiddleware.BodyDump(func(c echo.Context, reqBody, resBody []byte) {
		c.Set(middleware.ReqBodyLogKey, string(reqBody))
		c.Set(middleware.ResBodyLogKey, string(resBody))
	}))

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
	host := os.Getenv("APP_HOST")
	port := os.Getenv("APP_PORT")
	return fmt.Sprintf("%s:%s", host, port)
}

func (s *Server) Start() {
	log.Info("start suito server", log.Fields{
		"address": s.address,
		"ver":     viper.GetString("server.ver"),
	})

	db := openDB()
	s.e = api.InitRoute(s.e, db)

	go func() {
		if env.DEBUG {
			if err := s.e.Start(s.address); err != nil {
				log.Info("shutting down suito api server", log.Fields{"err": err})
			}
		} else {
			if err := s.e.StartAutoTLS(":443"); err != nil {
				log.Info("shutting down suito api server", log.Fields{"err": err})
			}
		}
	}()
}

// TODO DBオープン処理まとめる
func openDB() *gorm.DB {
	dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=utf8mb4&parseTime=True",
		os.Getenv("DB_USER"),
		os.Getenv("DB_PASS"),
		os.Getenv("DB_HOST"),
		os.Getenv("DB_PORT"),
		os.Getenv("DB_NAME"),
	)
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	logger := zapgorm2.New(zap.L())
	logger.SetAsDefault()
	logger.LogLevel = gormlogger.Info
	if err != nil {
		log.Fatal("error opening database", log.Fields{"err": err})
	}
	return db
}

func (s *Server) Stop() error {
	ctx, cancel := context.WithTimeout(context.Background(), 30*time.Second)
	defer cancel()
	return s.e.Shutdown(ctx)
}
