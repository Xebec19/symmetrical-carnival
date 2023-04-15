package main

import (
	"log"

	"github.com/Xebec19/symmetrical-carnival/posts"
	"github.com/Xebec19/symmetrical-carnival/util"
	"github.com/gofiber/fiber/v2"
)

// Package main implements a simple web server and implements REST APIs to
// be consumed by a frontend client
func main() {

	// loading env variables
	config, err := util.LoadConfig(".")
	if err != nil {
		log.Fatal("cannot load config:", err)
	}

	println(config.DUMMY)

	app := fiber.New()

	posts.SetRoute(app)

	app.Listen(":3000")
}
