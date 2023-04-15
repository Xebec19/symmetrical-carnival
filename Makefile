postgres:
	docker run --name blog -e POSTGRES_USER=root -e POSTGRES_PASSWORD=root -dp 5432:5432 postgres:12-alpine

createdb:
	docker exec -it blog createdb --username=root --owner=root blogdb

dropdb:
	docker exec -it khushi dropdb blogdb

debug:
	exec ~/go/bin/air

sqlc:
	sqlc generate


new-migration:
	atlas migrate new --dir "file://db/migration/"

inspect:
	atlas schema inspect -u "postgres://root:root@0.0.0.0:5432/blogdb?sslmode=disable" --format "{{ sql . }}"

.PHONE: debug postgres createdb dropdb sqlc new-migration inspect