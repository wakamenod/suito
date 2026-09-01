set dotenv-filename := ".env.suito"
set dotenv-load := true

_default:
    @just --list

# --- web (account-deletion page) --------------------------------------------
# The Go API and its MySQL are gone; docker-compose now only serves the static
# Flutter web build behind nginx on Lightsail.

restart:
    docker-compose kill
    docker-compose -f docker-compose-prod.yml up -d

up:
    cd web && just build
    docker-compose up -d

up-prod:
    docker-compose -f docker-compose-prod.yml up -d

up-log:
    cd web && just build
    docker-compose up

up-log-prod:
    docker-compose -f docker-compose-prod.yml up

down:
    docker-compose kill

ssm:
    aws ssm --profile private start-session --target ${SSM_INSTANCE_ID}

# --- supabase ----------------------------------------------------------------

# start / stop the local stack (Postgres, GoTrue, PostgREST, Edge Runtime, ...)
supabase-start:
    npx supabase start

supabase-stop:
    npx supabase stop

# drop and re-apply every migration against the local stack
supabase-reset:
    npx supabase db reset

# pgTAP suite under supabase/tests/database
supabase-test:
    npx supabase test db

# Deno tests for the Edge Functions (needs the local stack running)
supabase-test-functions:
    deno test --allow-net --allow-env supabase/functions/

# apply pending migrations to the linked (hosted) project
db-push:
    npx supabase db push

# deploy the Edge Functions to the linked project
functions-deploy:
    npx supabase functions deploy

# --- forced-update brake -----------------------------------------------------
# version_check.dart blocks builds older than app_config.min_required_version.
# The '1.0.0' default is below every build we ship, so this stays untouched in
# normal operation -- there is nothing to do at release time.

# show the hosted project's app_config row (needs .env.suito.prod)
show-app-version:
    sh scripts/require-app-version.sh get

# EMERGENCY ONLY. Locks out every client below <version> the moment it lands,
# so run it after a fixed build is downloadable from the store, not before.

# require <version> or newer, blocking older clients
require-app-version version:
    sh scripts/require-app-version.sh set "{{version}}"

# lift the brake (back to 1.0.0, which blocks nobody)
release-app-version:
    sh scripts/require-app-version.sh reset

# --- secret scanning (gitleaks) ---------------------------------------------

# point git at .githooks so the gitleaks pre-commit hook runs
install-hooks:
    git config core.hooksPath .githooks
    @echo "core.hooksPath -> .githooks"

# scan the whole git history (same check CI runs)
scan-secrets:
    gitleaks git . --redact --no-banner --verbose

# scan the working tree, including git-ignored files
scan-secrets-dir:
    gitleaks dir . --redact --no-banner --verbose

# scan only what is staged, as the pre-commit hook does
scan-secrets-staged:
    gitleaks git --pre-commit --staged --redact --no-banner --verbose
