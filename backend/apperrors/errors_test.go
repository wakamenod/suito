package apperrors

import (
	"context"
	"database/sql"
	"net/http"
	"testing"

	"github.com/pkg/errors"
	"github.com/stretchr/testify/require"
)

func TestHandleError(t *testing.T) {
	tests := []struct {
		name        string
		err         error
		wantStatus  int
		wantMessage string
	}{
		{
			name:        "ErrForbidden",
			err:         &SuitoError{ErrCode: InvalidIDToken, Err: errors.New("forbidden")},
			wantStatus:  http.StatusForbidden,
			wantMessage: string(messageInvalidIDToken),
		},
		{
			name:        "sql.ErrNoRows",
			err:         sql.ErrNoRows,
			wantStatus:  http.StatusNotFound,
			wantMessage: string(messageSQLNoRows),
		},
		{
			name:        "context.DeadlineExceeded",
			err:         context.DeadlineExceeded,
			wantStatus:  http.StatusGatewayTimeout,
			wantMessage: string(messageDeadlineExceeded),
		},
		{
			name:        "default",
			err:         errors.New("default error"),
			wantStatus:  http.StatusInternalServerError,
			wantMessage: string(messageUnknown),
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got := handleError(tt.err)
			require.Equal(t, tt.wantStatus, got.statusCode())
			require.EqualValues(t, tt.wantMessage, got.errorMessage())
		})
	}
}
