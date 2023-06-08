package api

import (
	"database/sql"
	"strconv"

	"github.com/Xebec19/symmetrical-carnival/util"
	"github.com/gofiber/fiber/v2"
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
//   - slug: slug of post
//
// Returns:
//   - status: boolean
//   - data: object containing a post
//   - message: string
func (server *Server) getPostById(c *fiber.Ctx) error {
	slug := c.Params("slug")

	post, err := server.store.GetOnePost(c.Context(), sql.NullString{String: slug, Valid: true})
	if err != nil {
		c.Status(fiber.StatusInternalServerError).JSON(util.ErrorResponse(err))
		return err
	}

	c.Status(fiber.StatusAccepted).JSON(util.SuccessResponse(post, "Posts fetched successfully"))
	return nil
}

// getPostSlugs expects a param i.e. limit in URL and returns that slug of posts
//
// Parameters:
//   - limit: no of slugs
//
// Returns:
//   - status: boolean
//   - data: object containing a post
//   - message: string
func (server *Server) getPostSlugs(c *fiber.Ctx) error {
	param := c.Params("limit")
	limit, err := strconv.Atoi(param)
	if err != nil {
		c.Status(fiber.StatusInternalServerError).JSON(util.ErrorResponse(err))
		return err
	}

	slugs, err := server.store.GetPostSlugs(c.Context(), int32(limit))

	if err != nil {
		c.Status(fiber.StatusInternalServerError).JSON(util.ErrorResponse(err))
		return err
	}

	c.Status(fiber.StatusAccepted).JSON(util.SuccessResponse(slugs, "Posts fetched successfully"))
	return nil
}
