CREATE TABLE "accounts" (
  "id" bigserial PRIMARY KEY,
  "full_name" varchar NOT NULL,
  "email" varchar NOT NULL UNIQUE,
  "phone_number" varchar NOT NULL UNIQUE,
  "pin" varchar NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT NOW(),
  "updated_at" timestamptz,
  "deleted_at" timestamptz
);

CREATE TABLE "transactions" (
  "id" bigserial PRIMARY KEY,
  "currency" varchar NOT NULL,
  "amount" bigint NOT NULL,
  "kind" bigint NOT NULL,
  "from_account_id" bigint,
  "to_account_id" bigint,
  "created_at" timestamptz NOT NULL DEFAULT NOW()
);

CREATE TABLE "exchanges" (
  "from_currency" varchar NOT NULL,
  "to_currency" varchar NOT NULL,
  "rate" decimal(1000,2) NOT NULL,
  "created_at" timestamptz NOT NULL DEFAULT NOW(),
  unique ("from_currency", "to_currency")
);

ALTER TABLE "transactions" ADD FOREIGN KEY ("from_account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transactions" ADD FOREIGN KEY ("to_account_id") REFERENCES "accounts" ("id");

CREATE INDEX ON "accounts" ("email");

CREATE INDEX ON "transactions" ("from_account_id");

CREATE INDEX ON "transactions" ("to_account_id");

CREATE INDEX ON "transactions" ("currency");

CREATE INDEX ON "transactions" ("kind");

CREATE INDEX ON "transactions" ("from_account_id", "to_account_id");

CREATE INDEX ON "transactions" ("from_account_id", "to_account_id", "kind");

CREATE INDEX ON "exchanges" ("from_currency");

CREATE INDEX ON "exchanges" ("to_currency");

CREATE INDEX ON "exchanges" ("from_currency", "to_currency");
