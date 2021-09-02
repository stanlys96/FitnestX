const Pool = require('pg').Pool;
require('dotenv').config();

const devConfig = `postgresql://${process.env.DATABASE_USER}:${process.env.DATABASE_PASSWORD}@${process.env.DATABASE_HOST}:${process.env.PORT}/${process.env.DATABASE}`;

const proConfig = process.env.DATABASE_URL;

const pool = new Pool({
  connectionString: process.env.NODE_ENV === "production" ? proConfig : devConfig,
});

module.exports = pool;