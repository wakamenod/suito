package validate

import (
	"github.com/wakamenod/suito/apperrors"
	validator "gopkg.in/go-playground/validator.v9"
)

type CustomValidator struct {
	validator *validator.Validate
}

func NewValidator() CustomValidator {
	v := validator.New()
	return CustomValidator{validator: v}
}

func (cv CustomValidator) Validate(i interface{}) error {
	err := cv.validator.Struct(i)
	if err != nil {
		return apperrors.InvalidParameter.Wrap(err)
	}

	return nil
}
