-- name: GetPosts :many
SELECT id, title, image_url, image_reference, created_at, description, updated_at, slug, "source", array_to_json(tags) as tags
FROM public.posts order by created_at desc;


-- name: GetOnePost :one
SELECT id, title, image_url, image_reference, created_at, updated_at, description, slug, "source", array_to_json(tags) as tags
FROM public.posts
WHERE slug = $1;

-- name: GetPostSlugs :many
SELECT slug FROM public.posts 
order by created_at desc limit $1;