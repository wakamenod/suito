package repositories

import (
	"github.com/pkg/errors"
)

func (r *SuitoRepository) FindTransactionMonths(uid string) ([]string, error) {
	var months []string

	if err := r.db.Raw(`
SELECT
  ym
FROM
(
  SELECT
    DATE_FORMAT(local_date, '%Y-%m') AS ym
  FROM
    expense
  WHERE
    uid = ? AND deleted_at is NULL

  UNION

  SELECT
    DATE_FORMAT(local_date, '%Y-%m') AS ym
  FROM
    income
  WHERE
    uid = ? AND deleted_at is NULL
) AS combined
GROUP BY
  ym
ORDER BY
  ym DESC;
`, uid, uid).Scan(&months).Error; err != nil {
		return nil, errors.Wrap(err, "failed to find expenses")
	}

	return months, nil
}
