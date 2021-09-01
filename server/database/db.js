const Pool = require('pg').Pool;

const pool = new Pool({
  user: process.env.DATABASE_USER,
  password: process.env.DATABASE_PASSWORD,
  database: "fitnestx_database",
  host: "localhost",
  port: 5432
});

module.exports = pool;