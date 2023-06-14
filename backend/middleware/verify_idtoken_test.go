package middleware

import (
	"context"
	"errors"
	"net/http"
	"net/url"
	"testing"

	"firebase.google.com/go/v4/auth"
	"github.com/labstack/echo/v4"
	"github.com/stretchr/testify/mock"
	"github.com/stretchr/testify/require"
	"github.com/wakamenod/suito/apperrors"
	mecho "github.com/wakamenod/suito/mock/echo"
)

const testUID = "testUID"

type MockAuthClient struct {
	mock.Mock
}

func (m *MockAuthClient) VerifyIDToken(ctx context.Context, idToken string) (*auth.Token, error) {
	args := m.Called(ctx, idToken)

	// args.Get(0) returns the first argument passed to m.Called
	token := args.Get(0)
	if token == nil {
		return nil, args.Error(1)
	}

	return token.(*auth.Token), args.Error(1)
}

func TestVerifyIDTokenSucess(t *testing.T) {
	mockContext := mecho.NewMockContext(t)
	mockContext.On("Request").Return(&http.Request{
		Header: http.Header{"Authorization": []string{"Bearer testToken"}},
		URL: &url.URL{
			Path: "/api/v1/endpoint",
		},
	})
	mockContext.On("Set", UIDKey, testUID)

	mockAuthClient := new(MockAuthClient)
	mockAuthClient.On("VerifyIDToken", mock.Anything, "testToken").Return(&auth.Token{UID: testUID}, nil)
	// Create a mock echo.HandlerFunc that will be the next middleware
	mockNext := func(c echo.Context) error {
		return nil
	}

	// Create the middleware with the mock dependencies
	middlewareFunc := VerifyIDTokenMiddleware(mockAuthClient)

	// Test the middleware
	middleware := middlewareFunc(mockNext)
	require.NoError(t, middleware(mockContext))

	mockAuthClient.AssertExpectations(t)
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

	mockAuthClient := new(MockAuthClient)
	mockAuthClient.On("VerifyIDToken", mock.Anything, "").Return(&auth.Token{}, errors.New("invalid token"))
	// Create a mock echo.HandlerFunc that will be the next middleware
	mockNext := func(c echo.Context) error {
		return nil
	}

	// Create the middleware with the mock dependencies
	middlewareFunc := VerifyIDTokenMiddleware(mockAuthClient)

	// Test the middleware
	middleware := middlewareFunc(mockNext)
	err := middleware(mockContext)
	require.Error(t, err)
	var suitoError *apperrors.SuitoError
	require.ErrorAs(t, err, &suitoError)
	require.Equal(t, apperrors.InvalidIDToken, suitoError.ErrCode)

	mockAuthClient.AssertExpectations(t)
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

	mockAuthClient := new(MockAuthClient)
	// Create a mock echo.HandlerFunc that will be the next middleware
	mockNext := func(c echo.Context) error {
		return nil
	}

	// Create the middleware with the mock dependencies
	middlewareFunc := VerifyIDTokenMiddleware(mockAuthClient)

	// Test the middleware
	middleware := middlewareFunc(mockNext)
	err := middleware(mockContext)
	require.NoError(t, err)

	mockAuthClient.AssertExpectations(t)
	mockContext.AssertExpectations(t)
}
