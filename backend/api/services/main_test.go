package services

import (
	"testing"

	"github.com/wakamenod/suito/api/services/testdata"
)

var aSer *SuitoService

func TestMain(m *testing.M) {
	repo := testdata.NewRepositoryMock()
	aSer = NewSuitoService(repo)

	m.Run()
}
