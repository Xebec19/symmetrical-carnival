#!/bin/bash
git checkout main && git pull

go get .

go build -o build -ldflags="-s -w"

make sqlc

cd db/ && soda migrate

pm2 restart build --name=blog-api