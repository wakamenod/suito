package validate

import (
	"log"

	"github.com/go-playground/validator/v10"
	"github.com/wakamenod/suito/apperrors"
)

type CustomValidator struct {
	validator *validator.Validate
}

func NewValidator() CustomValidator {
	v := validator.New()
	err := v.RegisterValidation("optional", func(_ validator.FieldLevel) bool { return true }, true)
	if err != nil {
		log.Fatal(err)
	}
	return CustomValidator{validator: v}
}

func (cv CustomValidator) Validate(i any) error {
	err := cv.validator.Struct(i)
	if err != nil {
		return apperrors.InvalidParameter.Wrap(err)
	}

	return nil
}
