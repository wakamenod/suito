package dateutils

import (
	"testing"
	"time"

	"github.com/stretchr/testify/require"
)

func TestYearMonthDateRange_Error(t *testing.T) {
	_, _, err := YearMonthDateRange("202203")
	require.Error(t, err)
}

func TestYearMonthDateRange(t *testing.T) {
	start, end, err := YearMonthDateRange("2022-10")
	require.NoError(t, err)
	require.Equal(t, time.Date(2022, 10, 1, 0, 0, 0, 0, time.UTC).Unix(), start.Unix())
	require.Equal(t, time.Date(2022, 10, 31, 23, 59, 59, 999999999, time.UTC).Unix(), end.Unix())
}
