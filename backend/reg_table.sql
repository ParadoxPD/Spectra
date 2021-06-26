DROP DATABSE IF EXISTS reg_table;
CREATE DATABSE reg_table;

\c reg_table

CREATE EXTENSION IF NOT EXISTS 'uuid-ossp';

CREATE TABLE   users (
    id uuid UNIQUE DEFAULT uuid_generate_v4(),
    email VARCHAR(128)NOT NULL UNIQUE,
    pass_word VARCHAR(128) NOT NULL,
    full_name VARCHAR(128) NOT NULL,
    user_state VARCHAR(50) NOT NULL,
    district VARCHAR(50) NOT NULL,
    designation VARCHAR(30) NOT NULL,
    registered BIGINT,
    token VARCHAR(128) UNIQUE,
    email_verified BOOLEAN,
    token_used_before BOOLEAN,
    PRIMARY KEY (email)

);