-- name: GetPosts :many
SELECT id, title, image_url, image_reference, created_at, description, updated_at, "source", array_to_json(tags) as tags
FROM public.posts order by created_at desc;


-- name: GetPostById :one
SELECT id, title, image_url, image_reference, created_at, updated_at, description, "source", array_to_json(tags) as tags
FROM public.posts
WHERE ID = $1;