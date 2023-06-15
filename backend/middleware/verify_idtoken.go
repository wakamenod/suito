package middleware

import (
	"net/http"
	"strings"

	"github.com/labstack/echo/v4"
	"github.com/wakamenod/suito/api/services/repositories"
	"github.com/wakamenod/suito/apperrors"
	"github.com/wakamenod/suito/client"
)

const UIDKey = "uidKey"

func VerifyIDTokenMiddleware(authClient client.AuthClient, repository repositories.Repository) echo.MiddlewareFunc {
	return func(next echo.HandlerFunc) echo.HandlerFunc {
		return func(c echo.Context) error {
			if c.Request().URL.Path == "/ping" {
				return next(c)
			}

			ctx := c.Request().Context()

			idToken := extractToken(c.Request())

			token, err := authClient.VerifyIDToken(ctx, idToken)
			if err != nil {
				return apperrors.InvalidIDToken.Wrap(err)
			}

			// TODO トランザクション
			if _, err := repository.FindOrCreateUser(token.UID); err != nil {
				return err
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
