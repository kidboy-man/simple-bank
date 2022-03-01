package db

import (
	"context"
	"fmt"
	"testing"

	"github.com/kidboy-man/simple-bank/util"
	"github.com/stretchr/testify/require"
)

func TestCreateAccount(t *testing.T) {
	arg := CreateAccountParams{
		FullName:    "John Doe",
		PhoneNumber: fmt.Sprintf("081212345%d", util.RandIntRange(100, 1000)),
		Email:       fmt.Sprintf("%s@example.com", util.RandStringRunes(8)),
		Pin:         "123456",
	}

	account, err := testQueries.CreateAccount(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, account)

	require.Equal(t, arg.FullName, account.FullName)
	require.Equal(t, arg.PhoneNumber, account.PhoneNumber)
	require.Equal(t, arg.Email, account.Email)
	require.Equal(t, arg.Pin, account.Pin) // TODO: hash the pin

	require.NotZero(t, account.ID)
	require.NotZero(t, account.CreatedAt)
}
