package services

import (
	"github.com/wakamenod/suito/api/services/repositories"
)

type SuitoService struct {
	repo repositories.Repository
}

func NewSuitoService(repo repositories.Repository) *SuitoService {
	return &SuitoService{repo: repo}
}
