package services

import (
	"database/sql"

	"github.com/wakamenod/suito/api/services/repositories"
	"github.com/wakamenod/suito/client"
)

type SuitoService struct {
	repo repositories.Repository
	TransactionProvider
}

type SuitoJobService struct {
	repo       repositories.Repository
	authClient client.AuthClient
	TransactionProvider
}

type TransactionProvider interface {
	Transaction(fc func(txRepo repositories.Repository) error, opts ...*sql.TxOptions) error
}

func NewSuitoService(repo repositories.Repository, provider TransactionProvider) *SuitoService {
	return &SuitoService{repo: repo, TransactionProvider: provider}
}

func NewSuitoJobService(repo repositories.Repository, provider TransactionProvider, client client.AuthClient) *SuitoJobService {
	return &SuitoJobService{repo: repo, TransactionProvider: provider, authClient: client}
}
