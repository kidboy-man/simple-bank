-- name: GetAccount :one
SELECT * FROM accounts
WHERE id = $1 LIMIT 1;

-- name: ListAccounts :many
SELECT * FROM accounts
ORDER BY id;

-- name: CreateAccount :one
INSERT INTO accounts (
  "full_name",
  "email",
  "phone_number",
  "pin"
) VALUES (
  $1, $2, $3, $4
)
RETURNING *;

-- name: DeleteAccount :exec
UPDATE accounts SET deleted_at = NOW()
WHERE id = $1;