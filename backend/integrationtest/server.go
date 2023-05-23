package integrationtest

import (
	"net/http"
	"testing"
	"time"

	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/server"
)

// CreateServer for testing on port 8081, returning a cleanup function that stops the server.
// Usage:
//
//	cleanup := CreateServer()
//	defer cleanup()
func CreateServer(t *testing.T) func() {
	s := server.New()
	go func() {
		s.Start()
	}()

	for {
		resp, err := http.Get("http://" + server.GetServerAddress() + "/")
		if err == nil {
			break
		}
		defer resp.Body.Close()
		time.Sleep(5 * time.Millisecond)
	}

	return func() {
		require.NoError(t, s.Stop())
	}
}

// SkipIfShort skips t if the "-short" flag is passed to "go test".
func SkipIfShort(t *testing.T) {
	if testing.Short() {
		t.SkipNow()
	}
}
