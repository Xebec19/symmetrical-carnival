// Package main implements a simple web server and implements REST APIs to
// be consumed by a frontend client
package main

import (
	"database/sql"
	"log"

	"github.com/Xebec19/symmetrical-carnival/api"
	db "github.com/Xebec19/symmetrical-carnival/db/sqlc"
	"github.com/Xebec19/symmetrical-carnival/util"
	_ "github.com/lib/pq"
)

func main() {

	// loading env variables
	config, err := util.LoadConfig(".")
	if err != nil {
		log.Fatal("cannot load config:", err)
	}

	conn, err := sql.Open(config.DB_DRIVER, config.DB_SOURCE)
	if err != nil {
		log.Fatal("cannot connect to db:", err)
	}

	store := db.New(conn)
	server := api.NewServer(store)
	err = server.Start(config.SERVER_ADDRESS)
	if err != nil {
		log.Fatal("cannot start server")
	}
}
