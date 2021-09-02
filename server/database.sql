CREATE DATABASE fitnestx_database;

--\c into users_database

CREATE TABLE users(
  user_id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255)
);