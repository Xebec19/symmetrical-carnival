-- name: GetPosts :many
SELECT id, title, image_url, image_reference, created_at, description, updated_at, "source", tags
FROM public.posts order by created_at desc;


-- name: GetPostById :one
SELECT id, title, image_url, image_reference, created_at, updated_at, description, "source", tags
FROM public.posts
WHERE ID = $1;