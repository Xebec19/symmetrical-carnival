// Package posts contains APIs for /posts routes
package posts

import "github.com/gofiber/fiber/v2"

// SetRoute implements /posts route
//
// Parameter:
//   - app: a *fiber.App which is the web server instantiated in main.go
func SetRoute(app *fiber.App) {
	router := app.Group("/posts")
	router.Get("/", getPost)
	router.Get("/:id", getPostById)
}
