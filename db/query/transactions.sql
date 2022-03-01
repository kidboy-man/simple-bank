-- name: GetTransaction :one
SELECT * FROM transactions
WHERE id = $1 LIMIT 1;

-- name: ListTransactions :many
SELECT * FROM transactions
ORDER BY id;

-- name: CreateTransaction :one
INSERT INTO transactions (
  "currency",
  "amount",
  "kind",
  "from_account_id",
  "to_account_id"
) VALUES (
  $1, $2, $3, $4, $5
)
RETURNING *;
