package log

import (
	"fmt"
	"io"

	"github.com/labstack/echo/v4"
	"github.com/labstack/gommon/log"
	"go.uber.org/zap"
)

type EchoLogger struct {
	Logger    *zap.Logger
	ErrLogger *zap.Logger
}

func (l *EchoLogger) Output() io.Writer {
	return nil
}

func (l *EchoLogger) Level() log.Lvl {
	return 0
}

func (l *EchoLogger) SetOutput(w io.Writer) {}

func (l *EchoLogger) SetLevel(v log.Lvl) {}

func (l *EchoLogger) Prefix() string {
	return ""
}

func (l *EchoLogger) SetPrefix(p string) {
}

func (l *EchoLogger) SetHeader(h string) {
}

func (l *EchoLogger) Print(i ...interface{}) {
	l.Logger.Info(fmt.Sprint(i...))
}

func (l *EchoLogger) Printf(format string, args ...interface{}) {
	l.ErrLogger.Error(fmt.Sprintf(format, args...))
}

func (l *EchoLogger) Printj(j log.JSON) {
	l.Logger.Info("printj", zap.Any("json", j))
}

func (l *EchoLogger) Debug(i ...interface{}) {
	l.Logger.Debug(fmt.Sprint(i...))
}

func (l *EchoLogger) Debugf(format string, args ...interface{}) {
	l.Logger.Debug(fmt.Sprintf(format, args...))
}

func (l *EchoLogger) Debugj(j log.JSON) {
	l.Logger.Debug("debugj", zap.Any("json", j))
}

func (l *EchoLogger) Info(i ...interface{}) {
	l.Logger.Info(fmt.Sprint(i...))
}

func (l *EchoLogger) Infof(format string, args ...interface{}) {
	l.Logger.Info(fmt.Sprintf(format, args...))
}

func (l *EchoLogger) Infoj(j log.JSON) {
	l.Logger.Info("infoj", zap.Any("json", j))
}

func (l *EchoLogger) Warn(i ...interface{}) {
	for _, e := range i {
		l.ErrLogger.Warn(fmt.Sprintf("%+v", e))
	}
}

func (l *EchoLogger) Warnf(format string, args ...interface{}) {
	l.ErrLogger.Warn(fmt.Sprintf(format, args...))
}

func (l *EchoLogger) Warnj(j log.JSON) {
	l.ErrLogger.Info("warnj", zap.Any("json", j))
}

func (l *EchoLogger) Error(i ...interface{}) {
	for _, e := range i {
		l.ErrLogger.Error(fmt.Sprintf("%+v", e))
	}
}

func (l *EchoLogger) Errorf(format string, args ...interface{}) {
	l.ErrLogger.Error(fmt.Sprintf(format, args...))
}

func (l *EchoLogger) Errorj(j log.JSON) {
	l.ErrLogger.Error("errorj", zap.Any("json", j))
}

func (l *EchoLogger) Fatal(i ...interface{}) {
	l.ErrLogger.Fatal(fmt.Sprint(i...))
}

func (l *EchoLogger) Fatalf(format string, args ...interface{}) {
	l.ErrLogger.Fatal(fmt.Sprintf(format, args...))
}

func (l *EchoLogger) Fatalj(j log.JSON) {
	l.ErrLogger.Fatal("infoj", zap.Any("json", j))
}

func (l *EchoLogger) Panic(i ...interface{}) {
	l.ErrLogger.Panic(fmt.Sprint(i...))
}

func (l *EchoLogger) Panicf(format string, args ...interface{}) {
	l.ErrLogger.Panic(fmt.Sprintf(format, args...))
}

func (l *EchoLogger) Panicj(j log.JSON) {
	l.ErrLogger.Panic("panicj", zap.Any("values", j))
}

func NewEchoLogger() echo.Logger {
	return &EchoLogger{
		Logger:    logger,
		ErrLogger: errLogger,
	}
}
