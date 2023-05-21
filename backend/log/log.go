package log

import (
	"fmt"
	"strings"
	"sync"

	"github.com/pkg/errors"
	"github.com/wakamenod/suito/env"
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
)

var (
	logger    *zap.Logger
	errLogger *zap.Logger

	commonOptions = []zap.Option{
		zap.AddCallerSkip(1),
	}
	LogMutex sync.Mutex
)

// Fields Log Fields
type Fields map[string]interface{}

type LogConfig struct {
	OutPath string
	ErrPath string
	Level   string
}

// Init
func Init(c LogConfig) error {
	if env.TEST {
		return initTestLogger(c)
	}

	return initLogger(c)
}

func initLogger(c LogConfig) error {
	{
		l, err := BuildLogger(c.OutPath, c.ErrPath, c.Level)
		if err != nil {
			return errors.Wrap(err, "failed build logger")
		}
		logger = l
	}
	{
		l, err := BuildLogger(c.ErrPath, c.ErrPath, c.Level)
		if err != nil {
			return errors.Wrap(err, "failed build error logger")
		}
		errLogger = l
	}
	return nil
}

func initTestLogger(c LogConfig) error {
	{
		l, err := buildTestLogger(c.OutPath, c.ErrPath, c.Level)
		if err != nil {
			return errors.Wrap(err, "failed build logger")
		}
		logger = l
	}
	{
		l, err := buildTestLogger(c.ErrPath, c.ErrPath, c.Level)
		if err != nil {
			return errors.Wrap(err, "failed build error logger")
		}
		errLogger = l
	}
	return nil
}

func BuildLogger(outPath, errPath, lv string) (*zap.Logger, error) {
	LogMutex.Lock()
	defer LogMutex.Unlock()
	level := getLogLevel(lv)

	cfg := zap.Config{
		Level:       level,
		Development: env.DEBUG,
		Encoding:    "json",
		EncoderConfig: zapcore.EncoderConfig{
			TimeKey:        "ts",
			LevelKey:       "level",
			NameKey:        "logger",
			CallerKey:      "caller",
			MessageKey:     "msg",
			LineEnding:     zapcore.DefaultLineEnding,
			EncodeLevel:    zapcore.LowercaseLevelEncoder,
			EncodeTime:     zapcore.ISO8601TimeEncoder,
			EncodeDuration: zapcore.StringDurationEncoder,
			EncodeCaller:   zapcore.ShortCallerEncoder,
		},
		DisableCaller:    !env.DEBUG,
		OutputPaths:      []string{outPath},
		ErrorOutputPaths: []string{errPath},
	}

	return cfg.Build()
}

func buildTestLogger(outPath, errPath, lv string) (*zap.Logger, error) {
	LogMutex.Lock()
	defer LogMutex.Unlock()
	level := getLogLevel(lv)

	cfg := zap.Config{
		Level:       level,
		Development: true,
		Encoding:    "console",
		EncoderConfig: zapcore.EncoderConfig{
			LevelKey:       "level",
			NameKey:        "logger",
			CallerKey:      "caller",
			MessageKey:     "msg",
			LineEnding:     zapcore.DefaultLineEnding,
			EncodeLevel:    zapcore.LowercaseLevelEncoder,
			EncodeTime:     zapcore.ISO8601TimeEncoder,
			EncodeDuration: zapcore.StringDurationEncoder,
			EncodeCaller:   zapcore.ShortCallerEncoder,
		},
		DisableCaller:    !env.DEBUG,
		OutputPaths:      []string{outPath},
		ErrorOutputPaths: []string{errPath},
	}

	return cfg.Build()
}

func getLogLevel(lv string) zap.AtomicLevel {
	level := zap.NewAtomicLevel()

	switch strings.ToLower(lv) {
	case "debug":
		level.SetLevel(zap.DebugLevel)
	case "info":
		level.SetLevel(zap.InfoLevel)
	case "warn":
		level.SetLevel(zap.WarnLevel)
	case "error":
		level.SetLevel(zap.ErrorLevel)
	case "dpanic":
		level.SetLevel(zap.DPanicLevel)
	case "panic":
		level.SetLevel(zap.PanicLevel)
	case "fatal":
		level.SetLevel(zap.FatalLevel)
	default:
		if env.DEBUG {
			level.SetLevel(zap.DebugLevel)
		}
	}
	return level
}

// Debug Log
func Debug(msg string, f Fields) {
	logger.WithOptions(commonOptions...).Debug(msg, zapValues(f)...)
}

func Debugf(format string, msg ...interface{}) {
	logger.WithOptions(commonOptions...).Debug(fmt.Sprintf(format, msg...), zapValues(Fields{})...)
}

// Info Log
func Info(msg string, f Fields) {
	logger.WithOptions(commonOptions...).Info(msg, zapValues(f)...)
}

func Infof(format string, msg interface{}, f Fields) {
	logger.WithOptions(commonOptions...).Info(fmt.Sprintf(format, msg), zapValues(f)...)
}

func InfoWithLoc(msg interface{}, f Fields) {
	err, ok := msg.(error)
	if ok {
		logger.WithOptions(commonOptions...).Info(fmt.Sprintf("%+v", err), zapValues(f)...)
	} else {
		logger.WithOptions(commonOptions...).Info(fmt.Sprintf("%v", msg), zapValues(f)...)
	}
}

// Warn Log
func Warn(msg interface{}, f Fields) {
	err, ok := msg.(error)
	if ok {
		errLogger.WithOptions(commonOptions...).Warn(fmt.Sprintf("%+v", err), zapValues(f)...)
	} else {
		errLogger.WithOptions(commonOptions...).Warn(fmt.Sprintf("%v", msg), zapValues(f)...)
	}
}

func Warnf(format string, msg interface{}, f Fields) {
	errLogger.WithOptions(commonOptions...).Warn(fmt.Sprintf(format, msg), zapValues(f)...)
}

// WarnWithLoc ...
func WarnWithLoc(msg interface{}, f Fields) {
	err, ok := msg.(error)
	if ok {
		errLogger.WithOptions(commonOptions...).Warn(fmt.Sprintf("%+v", err), zapValues(f)...)
	} else {
		errLogger.WithOptions(commonOptions...).Warn(fmt.Sprintf("%v", msg), zapValues(f)...)
	}
}

// Error Log
func Error(msg interface{}, f Fields) {
	err, ok := msg.(error)
	if ok {
		errLogger.WithOptions(commonOptions...).Error(fmt.Sprintf("%+v", err), zapValues(f)...)
	} else {
		errLogger.WithOptions(commonOptions...).Error(fmt.Sprintf("%v", msg), zapValues(f)...)
	}
}

// Errorf Log
func Errorf(format string, msg interface{}, f Fields) {
	errLogger.WithOptions(commonOptions...).Error(fmt.Sprintf(format, msg), zapValues(f)...)
}

// Fatal Log
func Fatal(msg interface{}, f Fields) {
	err, ok := msg.(error)
	if ok {
		errLogger.WithOptions(commonOptions...).Fatal(fmt.Sprintf("%+v", err), zapValues(f)...)
	} else {
		errLogger.WithOptions(commonOptions...).Fatal(fmt.Sprintf("%v", msg), zapValues(f)...)
	}
}

// Fatal Log
func Fatalf(format string, msg interface{}, f Fields) {
	errLogger.WithOptions(commonOptions...).Fatal(fmt.Sprintf(format, msg), zapValues(f)...)
}

func Close() error {
	_ = logger.Sync()
	_ = errLogger.Sync()

	return nil
}

func zapValues(f Fields) []zap.Field {
	var fs []zap.Field
	for k, v := range f {
		fs = append(fs, zap.Any(k, v))
	}
	if !env.TEST {
		fs = append(fs, zap.Any("version", env.GetVersionDetail()))
	}
	return fs
}
