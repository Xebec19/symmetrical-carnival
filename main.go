package main

import (
	"log"

	"github.com/Xebec19/symmetrical-carnival/util"
	"github.com/gofiber/fiber"
)

func main() {

	config, err := util.LoadConfig(".")
	if err != nil {
		log.Fatal("cannot load config:", err)
	}

	println(config.DUMMY)

	app := fiber.New()

	app.Listen(":3000")
}
