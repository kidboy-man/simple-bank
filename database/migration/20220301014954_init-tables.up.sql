CREATE TABLE "accounts" (
  "id" int PRIMARY KEY,
  "full_name" varchar,
  "email" varchar UNIQUE,
  "phone_number" varchar UNIQUE,
  "pin" varchar,
  "created_at" timestamp,
  "updated_at" timestamp,
  "deleted_at" timestamp
);

CREATE TABLE "transactions" (
  "id" SERIAL PRIMARY KEY,
  "currency" varchar,
  "amount" int,
  "kind" int,
  "from_account_id" int,
  "to_account_id" int,
  "created_at" timestamp
);

CREATE TABLE "exchanges" (
  "from_currency" varchar,
  "to_currency" varchar,
  "rate" decimal(1000,2),
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
