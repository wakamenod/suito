//go:build release
// +build release

package env

const DEBUG = false

var (
	TEST       = false
	Name       = "release"
	Version    = "0.0.1"
	CommitHash = "XXXX"
)

func Setup() {
}
