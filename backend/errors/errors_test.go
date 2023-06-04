package errors

import (
	"context"
	"database/sql"
	"net/http"
	"testing"

	"github.com/labstack/echo/v4"
	"github.com/pkg/errors"
	"github.com/stretchr/testify/require"
)

func TestHandleError(t *testing.T) {
	tests := []struct {
		name string
		err  error
		want int
	}{
		{
			name: "ErrForbidden",
			err:  ErrForbidden,
			want: http.StatusForbidden,
		},
		{
			name: "ErrConnectionRefuse",
			err:  ErrConnectionRefuse,
			want: http.StatusInternalServerError,
		},
		{
			name: "sql.ErrNoRows",
			err:  sql.ErrNoRows,
			want: http.StatusNotFound,
		},
		{
			name: "context.DeadlineExceeded",
			err:  context.DeadlineExceeded,
			want: http.StatusGatewayTimeout,
		},
		{
			name: "echo.HTTPError",
			err:  echo.NewHTTPError(http.StatusBadGateway, "example message"),
			want: http.StatusBadGateway,
		},
		{
			name: "default",
			err:  errors.New("default error"),
			want: http.StatusInternalServerError,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, _, _ := handleError(tt.err)
			require.Equal(t, tt.want, got)
		})
	}
}
