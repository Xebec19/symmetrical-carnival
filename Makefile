postgres:
	docker run --name blog -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -dp 5432:5432 postgres:12-alpine

createdb:
	docker exec -it blog createdb --username=root --owner=root blogdb

dropdb:
	docker exec -it khushi dropdb blogdb

debug:
	exec ~/go/bin/air

build:
	go build -o build -ldflags="-s -w"

sqlc:
	sqlc generate


new-migration:
	soda generate sql 

migrate:
	soda migrate

migrate-down:
	soda migrate down

deploy:
	pm2 deploy pm2.config.js blog-api

scan: 
	govulncheck ./...

.PHONY: debug postgres createdb dropdb sqlc new-migration inspect build new-migration migrate migrate-down deploy scan