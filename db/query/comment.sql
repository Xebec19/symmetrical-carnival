-- name: GetComments :many
SELECT id, post_id, author_id, platform, created_at, updated_at, body
FROM comments where id = $1;
