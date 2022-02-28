VERSION=0.0.1
AUTHOR=kidboy-man
GIT_DIR=$(git rev-parse --git-dir)

.PHONY: generate-swagger
## generate-swagger: generate swagger file
generate-swagger:
	@bee generate docs


.PHONY: init
## generate-swagger: generate swagger file
init:
	@sh scripts/install-pre-push.bash 
	@sh scripts/install-pre-commit.bash 


.PHONY: deps-install
## deps-install: Install packages and dependencies
deps-install:
	@go mod download

.PHONY: run-migration
## run-migrations: running migrations
run-migration:
	@migrate -database postgres://postgres:password@localhost:5432/simple_bank?sslmode=disable -path database/migration up

.PHONY: create-migration
## create-migration: create migrations table
create-migration:
	@read -p "migration name ? : " migration_name \
	&& migrate create -ext sql -dir database/migration "$${migration_name}"

.PHONY: lint-check
## lint-check: checking code with golangci-lint
lint-check:
	@golangci-lint run

.PHONY: lint-fix
## lint-fix: checking code with golangci-lint and fix it
lint-fix:
	@golangci-lint run --fix
