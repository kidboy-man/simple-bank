// Code generated by sqlc. DO NOT EDIT.

package db

import (
	"database/sql"
	"time"
)

type Account struct {
	ID          int64        `json:"id"`
	FullName    string       `json:"full_name"`
	Email       string       `json:"email"`
	PhoneNumber string       `json:"phone_number"`
	Pin         string       `json:"pin"`
	CreatedAt   time.Time    `json:"created_at"`
	UpdatedAt   sql.NullTime `json:"updated_at"`
	DeletedAt   sql.NullTime `json:"deleted_at"`
}

type Exchange struct {
	FromCurrency string    `json:"from_currency"`
	ToCurrency   string    `json:"to_currency"`
	Rate         string    `json:"rate"`
	CreatedAt    time.Time `json:"created_at"`
}

type Transaction struct {
	ID            int64         `json:"id"`
	Currency      string        `json:"currency"`
	Amount        int64         `json:"amount"`
	Kind          int64         `json:"kind"`
	FromAccountID sql.NullInt64 `json:"from_account_id"`
	ToAccountID   sql.NullInt64 `json:"to_account_id"`
	CreatedAt     time.Time     `json:"created_at"`
}
