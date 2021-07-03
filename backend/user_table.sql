DROP DATABASE IF EXISTS user_table;
CREATE DATABASE user_table;

\c user_table;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE users (
  id uuid UNIQUE DEFAULT uuid_generate_v4 (),
  email VARCHAR(128) NOT NULL UNIQUE,
  password VARCHAR(128) NOT NULL,
  registered BIGINT,
  token VARCHAR(128) UNIQUE,
  createdtime BIGINT,
  emailVerified BOOLEAN,
  tokenusedbefore BOOLEAN,
  PRIMARY KEY (email)
);