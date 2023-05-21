//go:build !release
// +build !release

package env

const DEBUG = true

var (
	TEST       = false
	Name       = "debug"
	Version    = "0.0.1"
	CommitHash = "XXXX"
)

func Setup() {
}
