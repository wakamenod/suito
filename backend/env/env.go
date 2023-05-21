package env

import (
	"fmt"

	"github.com/denisbrodbeck/machineid"
)

var MachineID = "develop-machine"
var appKey = "suito-api-server"

func GetVersionDetail() string {
	return fmt.Sprintf("%s-%s-%s", Name, Version, CommitHash)
}

func init() {
	MachineID, _ = machineid.ProtectedID(appKey)
}
