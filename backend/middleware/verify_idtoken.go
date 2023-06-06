package middleware

import (
	"context"
	"net/http"
	"strings"

	"firebase.google.com/go/v4/auth"
	"github.com/labstack/echo/v4"
	"github.com/wakamenod/suito/apperrors"
)

const UIDKey = "uidKey"

// Define an interface for the Firebase Auth client
type AuthClient interface {
	VerifyIDToken(ctx context.Context, idToken string) (*auth.Token, error)
}

func VerifyIDTokenMiddleware(authClient AuthClient) echo.MiddlewareFunc {
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(c echo.Context) error {
			ctx := c.Request().Context()

			idToken := extractToken(c.Request())

			token, err := authClient.VerifyIDToken(ctx, idToken)
			if err != nil {
				return apperrors.InvalidIDToken.Wrap(err)
			}

			c.Set(UIDKey, token.UID)

			return next(c)
		}
	}
}

func extractToken(r *http.Request) string {
	bearToken := r.Header.Get("Authorization")
	strArr := strings.Split(bearToken, " ")
	if len(strArr) == 2 {
		return strArr[1]
	}
	return ""
}
