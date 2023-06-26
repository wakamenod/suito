//go:build !release
// +build !release

package env

const DEBUG = true

var (
	TEST       = ""
	Name       = "debug"
	Version    = "1.0.1"
	CommitHash = "XXXX"
)

func Setup() {
}
