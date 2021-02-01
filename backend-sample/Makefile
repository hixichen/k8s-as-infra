APP_NAME=backend-sample

.PHONY: fmt tidy vendor test build run runs rund cleandb runc \
	sample_client_test dashboard_client_test client_test health_check update_api

GO=GOPRIVATE=github.com/mycompany /usr/local/bin/go

fmt:
	$(GO) fmt ./...

tidy:
	$(GO) mod tidy

vendor:
	$(GO) mod download

test: vendor
	$(GO) test -cover -race -v ./...

build: vendor
	docker build --tag $(APP_NAME) .

# For local development and testing.
run: build
	docker run -d -p 9090:9090 $(APP_NAME)

# For local development without docker
runs:
	$(GO) build && ./backend-sample -server_type=backend-sample

rund:
	$(GO) build && ./backend-sample -server_type=dashboard

cleandb:
	dropdb `whoami`
	createdb

runc: cleandb runs

health_check:
	$(GO) build && ./backend-sample -client=true -health=true -client_type=all

API_COMMIT?=master

update_api:
	$(GO) get github.com/mycompany/sample-api@$(API_COMMIT)

sample_client_test:
	$(GO) build && ./backend-sample -client=true -client_type=sample-client -server_type=backend-sample

dashboard_client_test:
	$(GO) build && ./backend-sample -client=true -client_type=dashboard-client -server_type=dashboard

client_test:
	$(GO) build && ./backend-sample -client=true -client_type=all
