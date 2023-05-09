#!/bin/bash
git pull

go get .

go build -o build -ldflags="-s -w"

cd db/ && soda migrate