-- name: GetExchangeFromTo :one
SELECT * FROM exchanges
WHERE from_currency = $1 AND to_currency = $2 LIMIT 1;

-- name: ListExchanges :many
SELECT * FROM exchanges
ORDER BY from_currency, to_currency ASC;

-- name: CreateExchange :one
INSERT INTO exchanges (
  "from_currency",
  "to_currency",
  "rate"
) VALUES (
  $1, $2, $3
)
RETURNING *;
