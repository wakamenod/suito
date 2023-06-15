package client

import (
	"context"

	firebase "firebase.google.com/go/v4"
	"firebase.google.com/go/v4/auth"
	"github.com/wakamenod/suito/log"
)

type AuthUserIterator interface {
	Next() (*auth.ExportedUserRecord, error)
}

// Define an interface for the Firebase Auth client
type AuthClient interface {
	VerifyIDToken(ctx context.Context, idToken string) (*auth.Token, error)
	Users(ctx context.Context, nextPageToken string) AuthUserIterator
}

type FirebaseAuthClient struct {
	*auth.Client
}

func (f *FirebaseAuthClient) VerifyIDToken(ctx context.Context, idToken string) (*auth.Token, error) {
	return f.Client.VerifyIDToken(ctx, idToken)
}

func (f *FirebaseAuthClient) Users(ctx context.Context, nextPageToken string) AuthUserIterator {
	return f.Client.Users(ctx, nextPageToken)
}

func NewFirebaseAuthClient() *FirebaseAuthClient {
	ctx := context.Background()
	app, err := firebase.NewApp(ctx, nil)
	if err != nil {
		log.Fatal("error initializing Firebase App", log.Fields{"err": err})
	}
	client, err := app.Auth(ctx)
	if err != nil {
		log.Fatal("error getting Firebase Auth client", log.Fields{"err": err})
	}
	return &FirebaseAuthClient{client}
}
