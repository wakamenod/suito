package dateutils

import (
	"time"

	"github.com/jinzhu/now"
	"github.com/pkg/errors"
)

// yearMonthはYYYY-MMk
func YearMonthDateRange(yearMonth string) (*time.Time, *time.Time, error) {
	start, err := now.ParseInLocation(time.UTC, yearMonth)
	if err != nil {
		return nil, nil, errors.Wrap(err, "failed to parse yearMonth")
	}
	end := now.With(start).EndOfMonth()
	return &start, &end, nil
}
