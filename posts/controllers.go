package posts

import (
	"github.com/Xebec19/symmetrical-carnival/util"
	"github.com/gofiber/fiber/v2"
)

// getPost fetches all posts
func getPost(c *fiber.Ctx) error {
	return c.Status(fiber.StatusAccepted).JSON(util.SuccessResponse(nil, "Posts fetched successfully"))
}

// getPostById fetches one post
func getPostById(c *fiber.Ctx) error {
	return c.Status(fiber.StatusAccepted).JSON(util.SuccessResponse(nil, "Post fetched successfully"))
}
