package services

import (
	"testing"

	"github.com/wakamenod/suito/api/services/testdata"
)

var aSer *SuitoService

func TestMain(m *testing.M) {
	aSer = NewSuitoService(&testdata.TestRepositoryMock)

	m.Run()
}
