#!/bin/bash
git pull

go build -o build -ldflags="-s -w"

cd db/ && soda migrate