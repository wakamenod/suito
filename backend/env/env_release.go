//go:build release
// +build release

package env

const DEBUG = false

var (
	TEST       = ""
	Name       = "release"
	Version    = "1.0.0"
	CommitHash = "XXXX"
)

func Setup() {
}
