package api

import (
	db "github.com/Xebec19/symmetrical-carnival/db/sqlc"
	"github.com/gofiber/fiber/v2"
)

type Server struct {
	store  *db.Queries
	router *fiber.App
}

func NewServer(store *db.Queries) *Server {
	server := &Server{store: store}
	router := fiber.New()

	api := router.Group("/api")

	posts := api.Group("/posts")
	posts.Get("/", server.getAllPost)

	server.router = router
	return server
}

func (server *Server) Start(address string) error {
	return server.router.Listen(address)
}