package api

import (
	"context"

	"github.com/Xebec19/symmetrical-carnival/util"
	"github.com/gofiber/fiber/v2"
)

func (server *Server) getAllPost(c *fiber.Ctx) error {
	posts, err := server.store.GetPosts(context.Background())
	if err != nil {
		c.Status(fiber.StatusInternalServerError).JSON(util.ErrorResponse(err))
		return err
	}

	c.Status(fiber.StatusAccepted).JSON(util.SuccessResponse(posts, "Posts fetched successfully"))
	return nil
}
