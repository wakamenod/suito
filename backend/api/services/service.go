package services

import (
	"github.com/wakamenod/suito/api/services/repositories"
	"github.com/wakamenod/suito/client"
)

type SuitoService struct {
	repo repositories.Repository
}

type SuitoJobService struct {
	repo       repositories.Repository
	authClient client.AuthClient
}

func NewSuitoService(repo repositories.Repository) *SuitoService {
	return &SuitoService{repo: repo}
}

func NewSuitoJobService(repo repositories.Repository, client client.AuthClient) *SuitoJobService {
	return &SuitoJobService{repo: repo, authClient: client}
}
