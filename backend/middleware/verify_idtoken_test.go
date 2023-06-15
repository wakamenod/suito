package middleware

import (
	"context"
	"errors"
	"net/http"
	"net/url"
	"testing"

	"firebase.google.com/go/v4/auth"
	"github.com/labstack/echo/v4"
	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/api/services/repositories"
	"github.com/wakamenod/suito/apperrors"
	"github.com/wakamenod/suito/client"
	mecho "github.com/wakamenod/suito/mock/echo"
	"github.com/wakamenod/suito/model"
)

const testUID = "testUID"

func TestVerifyIDTokenSucess(t *testing.T) {
	mockContext := mecho.NewMockContext(t)
	mockContext.On("Request").Return(&http.Request{
		Header: http.Header{"Authorization": []string{"Bearer testToken"}},
		URL: &url.URL{
			Path: "/api/v1/endpoint",
		},
	})
	mockContext.On("Set", UIDKey, testUID)

	mockAuthClient := &client.AuthClientMock{
		VerifyIDTokenFunc: func(ctx context.Context, idToken string) (*auth.Token, error) {
			return &auth.Token{UID: testUID}, nil
		},
	}

	// Create a mock echo.HandlerFunc that will be the next middleware
	mockNext := func(c echo.Context) error {
		return nil
	}

	repositoryMock := repositories.RepositoryMock{
		FindOrCreateUserFunc: func(uid string) (model.User, error) {
			return model.User{UID: "user1", ID: "user1_id"}, nil
		},
	}

	// Create the middleware with the mock dependencies
	middlewareFunc := VerifyIDTokenMiddleware(mockAuthClient, &repositoryMock)

	// Test the middleware
	middleware := middlewareFunc(mockNext)
	require.NoError(t, middleware(mockContext))

	require.Equal(t, 1, len(mockAuthClient.VerifyIDTokenCalls()))
	mockContext.AssertExpectations(t)
}

func TestVerifyIDTokenEmpty(t *testing.T) {
	mockContext := mecho.NewMockContext(t)
	mockContext.On("Request").Return(&http.Request{
		Header: http.Header{"Authorization": []string{"Bearer"}},
		URL: &url.URL{
			Path: "/api/v1/endpoint",
		},
	})

	mockAuthClient := &client.AuthClientMock{
		VerifyIDTokenFunc: func(ctx context.Context, idToken string) (*auth.Token, error) {
			return &auth.Token{}, errors.New("invalid token")
		},
	}

	// mockAuthClient := new(MockAuthClient)
	// mockAuthClient.On("VerifyIDToken", mock.Anything, "").Return(&auth.Token{}, errors.New("invalid token"))
	// Create a mock echo.HandlerFunc that will be the next middleware
	mockNext := func(c echo.Context) error {
		return nil
	}

	repositoryMock := repositories.RepositoryMock{
		FindOrCreateUserFunc: func(uid string) (model.User, error) {
			return model.User{UID: "user1", ID: "user1_id"}, nil
		},
	}

	// Create the middleware with the mock dependencies
	middlewareFunc := VerifyIDTokenMiddleware(mockAuthClient, &repositoryMock)

	// Test the middleware
	middleware := middlewareFunc(mockNext)
	err := middleware(mockContext)
	require.Error(t, err)
	var suitoError *apperrors.SuitoError
	require.ErrorAs(t, err, &suitoError)
	require.Equal(t, apperrors.InvalidIDToken, suitoError.ErrCode)

	require.Equal(t, 1, len(mockAuthClient.VerifyIDTokenCalls()))
	mockContext.AssertExpectations(t)
}

func TestVerifyIDTokenSkip(t *testing.T) {
	mockContext := mecho.NewMockContext(t)
	mockContext.On("Request").Return(&http.Request{
		Header: http.Header{"Authorization": []string{"Bearer"}},
		URL: &url.URL{
			Path: "/ping",
		},
	})

	mockAuthClient := &client.AuthClientMock{
		VerifyIDTokenFunc: func(ctx context.Context, idToken string) (*auth.Token, error) {
			return &auth.Token{}, errors.New("invalid token")
		},
	}

	// mockAuthClient := new(MockAuthClient)
	// Create a mock echo.HandlerFunc that will be the next middleware
	mockNext := func(c echo.Context) error {
		return nil
	}

	repositoryMock := repositories.RepositoryMock{
		FindOrCreateUserFunc: func(uid string) (model.User, error) {
			return model.User{UID: "user1", ID: "user1_id"}, nil
		},
	}

	// Create the middleware with the mock dependencies
	middlewareFunc := VerifyIDTokenMiddleware(mockAuthClient, &repositoryMock)

	// Test the middleware
	middleware := middlewareFunc(mockNext)
	err := middleware(mockContext)
	require.NoError(t, err)

	require.Equal(t, 0, len(mockAuthClient.VerifyIDTokenCalls()))
	mockContext.AssertExpectations(t)
}
