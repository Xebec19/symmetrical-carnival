-- name: GetPosts :many
SELECT id, title, created_at, updated_at, "source", tags
FROM public.posts;


-- name: GetPostById :one
SELECT id, title, created_at, updated_at, "source", tags
FROM public.posts
WHERE ID = $1;