CREATE DATABASE fitnestx_database;

--\c into users_database

CREATE TABLE users(
  user_id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255)
);

ALTER TABLE users
ADD COLUMN gender VARCHAR(10),
ADD COLUMN date_of_birth DATE,
ADD COLUMN weight REAL,
ADD COLUMN height REAL;