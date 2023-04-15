// Package util contains helpful functions that are used throughout the codebase
// to acheive miscellaneous operations
package util

import "github.com/gofiber/fiber"

// ErrorResponse helps to format error responses returned by controllers
// its main purpose is to keep uniformity throughout the codebase for error responses
//
// Parameters:
//   - err: an error Object
//
// Returns:
//   - status: it is a boolean value which represents if the request was success
//   - payload: error message
//   - message: error message
func ErrorResponse(err error) fiber.Map {
	return fiber.Map{
		"status":  false,
		"payload": err.Error(),
		"message": err.Error(),
	}
}

// SuccessResponse helps to format responses returned by controllers
// its main purpose is to keep uniformity throughout the codebase for responses
//
// Parameters:
//   - data: a interface{} that represents data served in response to the request
//   - message: a string that shows message returned by the controller after serving the request
//
// Returns:
//   - status: it is a boolean value which represents if the request was success
//   - payload: data
//   - message: message
func SuccessResponse(data interface{}, message string) fiber.Map {
	return fiber.Map{
		"status":  true,
		"payload": data,
		"message": message,
	}
}
