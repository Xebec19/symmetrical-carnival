package api

import (
	"github.com/Xebec19/symmetrical-carnival/util"
	"github.com/gofiber/fiber/v2"
	"github.com/google/uuid"
)

// getPost returns all posts
//
// Returns:
//   - status: boolean
//   - data: array containing all posts
//   - message: string
func (server *Server) getPost(c *fiber.Ctx) error {
	posts, err := server.store.GetPosts(c.Context())
	if err != nil {
		c.Status(fiber.StatusInternalServerError).JSON(util.ErrorResponse(err))
		return err
	}

	c.Status(fiber.StatusAccepted).JSON(util.SuccessResponse(posts, "Posts fetched successfully"))
	return nil
}

// getPostById expects a param i.e. id in URL and returns that post only
//
// Parameters:
//   - id: UUID in params
//
// Returns:
//   - status: boolean
//   - data: object containing a post
//   - message: string
func (server *Server) getPostById(c *fiber.Ctx) error {
	id := c.Params("id")

	parsedUUID, err := uuid.Parse(id)
	if err != nil {
		c.Status(fiber.StatusBadRequest).JSON(util.ErrorResponse(err))
		return err
	}

	post, err := server.store.GetPostById(c.Context(), parsedUUID)
	if err != nil {
		c.Status(fiber.StatusInternalServerError).JSON(util.ErrorResponse(err))
		return err
	}

	c.Status(fiber.StatusAccepted).JSON(util.SuccessResponse(post, "Posts fetched successfully"))
	return nil
}
