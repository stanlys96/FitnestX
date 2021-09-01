let env = process.env.NODE_ENV;
const pool = require('./database/db');

const express = require('express');
const app = express();
const cors = require('cors');

app.use(cors());
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.post('/users', async (req, res) => {
  try {
    const { first_name, last_name } = req.body;
    const newUser = await pool.query("INSERT INTO users (first_name, last_name) VALUES ($1, $2) RETURNING *", [first_name, last_name]);
    res.json(newUser);
  } catch(err) {
    console.log(err.message);
  }
});

app.listen(3000, () => {
  console.log("Listening on port: " + 3000);
});

module.exports = app;