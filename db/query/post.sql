-- name: GetPosts :many
select ID, TITLE, content, CREATED_AT from POSTS;

-- name: GetPostById :one
select ID, TITLE, content, CREATED_AT from POSTS WHERE ID = $1;