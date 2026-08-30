set dotenv-filename := ".env.suito"
set dotenv-load := true

DDL_SRC := "ddl/migrations"

_default:
    @just --list

install:
    go install -tags mysql github.com/golang-migrate/migrate/v4/cmd/migrate@v4.15.1

restart:
    docker-compose kill
    docker-compose -f docker-compose-prod.yml up -d

up:
    cd backend && just build
    cd web && just build
    docker-compose up -d

up-prod:
    cd backend && just build-prod
    docker-compose -f docker-compose-prod.yml up -d

up-log:
    cd backend && just build
    cd web && just build
    docker-compose up

up-log-prod:
    cd backend && just build-prod
    docker-compose -f docker-compose-prod.yml up

down:
    docker-compose kill

migrate-up: (_migrate "up")

migrate-down: (_migrate "down")

migrate-drop: (_migrate "drop")

[private]
_migrate direction:
    #!/usr/bin/env bash
    set -o pipefail
    DB_CONNECT="mysql://${DB_USER}:${DB_PASS}@tcp(${DB_HOST}:${DB_PORT})/${DB_NAME}"
    DB_CONNECT_TEST="mysql://${DB_USER}:${DB_PASS}@tcp(${DB_HOST}:${DB_PORT})/${DB_NAME_TEST}"
    echo y | migrate -source "file://{{DDL_SRC}}" -database "$DB_CONNECT" {{direction}}
    echo y | migrate -source "file://{{DDL_SRC}}" -database "$DB_CONNECT_TEST" {{direction}}

ssm:
    aws ssm --profile private start-session --target ${SSM_INSTANCE_ID}

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
