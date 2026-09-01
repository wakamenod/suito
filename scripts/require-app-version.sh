#!/usr/bin/env sh
#
# Read / raise `app_config.min_required_version` on the hosted (linked) project.
#
# This is an emergency brake, not a release step. version_check.dart blocks
# builds *older* than this value with a dialog the user cannot dismiss, and the
# '1.0.0' default is below every build we have ever shipped -- so a project
# where this is never touched never blocks anyone. Raise it only to pull a
# release, and only once a fixed build is downloadable from the store: every
# client below the new floor is locked out the moment this lands.
#
# The Supabase CLI has no ad-hoc SQL command, so this goes through PostgREST
# with the service_role key. service_role keeps its UPDATE privilege on
# app_config (0004 and 0006 only revoke from anon / authenticated) and bypasses
# RLS, whose only policy is a SELECT one. That is pinned by
# supabase/tests/database/03_grants_test.sql.
#
# Credentials come from .env.suito.prod (gitignored), which needs:
#
#   SUPABASE_URL=https://<project-ref>.supabase.co
#   SUPABASE_SERVICE_ROLE_KEY=<service_role key from Dashboard > API>
#
# Usage:
#   scripts/require-app-version.sh get         # show the current row
#   scripts/require-app-version.sh set 1.0.3   # require 1.0.3 or newer
#   scripts/require-app-version.sh reset       # back to 1.0.0 (blocks nobody)
set -eu

root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
env_file="$root/.env.suito.prod"

cmd="${1:-}"
case "$cmd" in
get | reset) ;;
set)
    if [ -z "${2:-}" ]; then
        echo "usage: $0 set <version>   (e.g. $0 set 1.0.3)" >&2
        exit 2
    fi
    ;;
*)
    echo "usage: $0 {get|set <version>|reset}" >&2
    exit 2
    ;;
esac

if [ -f "$env_file" ]; then
    # shellcheck disable=SC1090
    . "$env_file"
fi

: "${SUPABASE_URL:?set SUPABASE_URL in .env.suito.prod (https://<project-ref>.supabase.co)}"
: "${SUPABASE_SERVICE_ROLE_KEY:?set SUPABASE_SERVICE_ROLE_KEY in .env.suito.prod}"

endpoint="${SUPABASE_URL%/}/rest/v1/app_config?id=eq.1"
select="&select=min_required_version,updated_at"

# The key is passed to curl only through -H; never echoed, and no `set -x`.
request() {
    method="$1"
    url="$2"
    shift 2
    body_file=$(mktemp)
    # shellcheck disable=SC2064
    trap "rm -f '$body_file'" EXIT
    code=$(curl -sS -o "$body_file" -w '%{http_code}' -X "$method" "$url" \
        -H "apikey: $SUPABASE_SERVICE_ROLE_KEY" \
        -H "Authorization: Bearer $SUPABASE_SERVICE_ROLE_KEY" \
        -H "Accept: application/json" \
        "$@")
    cat "$body_file"
    echo
    case "$code" in
    2*) ;;
    *)
        echo "require-app-version: $method $url failed with HTTP $code" >&2
        exit 1
        ;;
    esac
}

write() {
    version="$1"
    # Dotted integers only. compareVersions() in version_check.dart fails open
    # on anything else, so a typo here would silently disarm the brake.
    if ! echo "$version" | grep -Eq '^[0-9]+(\.[0-9]+)*$'; then
        echo "require-app-version: '$version' is not a dotted integer version" >&2
        exit 2
    fi
    echo "require-app-version: min_required_version -> $version on ${SUPABASE_URL%/}"
    request PATCH "$endpoint$select" \
        -H "Content-Type: application/json" \
        -H "Prefer: return=representation" \
        -d "{\"min_required_version\":\"$version\"}"
}

case "$cmd" in
get)
    request GET "$endpoint$select"
    ;;
set)
    write "$2"
    ;;
reset)
    write 1.0.0
    ;;
esac
