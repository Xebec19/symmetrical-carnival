package api

import (
	"github.com/Xebec19/symmetrical-carnival/util"
	"github.com/gofiber/fiber/v2"
	"github.com/google/uuid"
)

// getComment returns all comments of a post. It expects id of the post in the URL as params
//
// Parameters:
//   - id: uuid that represents post id
//
// Returns:
//   - status: boolean
//   - data: array which contains all comments
//   - message: string
func (server *Server) getComment(c *fiber.Ctx) error {
	id := c.Params("id")

	parsedUUID, err := uuid.Parse(id)
	if err != nil {
		c.Status(fiber.StatusInternalServerError).JSON(util.ErrorResponse(err))
		return err
	}

	post, err := server.store.GetComments(c.Context(), parsedUUID)
	if err != nil {
		c.Status(fiber.StatusInternalServerError).JSON(util.ErrorResponse(err))
		return err
	}

	c.Status(fiber.StatusAccepted).JSON(util.SuccessResponse(post, "Comments fetched successfully"))
	return nil
}
