const pool = require('../database/db');
const { hashPassword } = require('../helpers/bcrypt');

class User {
  static async register(user) {
    let { first_name, last_name, email, password } = user;
    password = hashPassword(password);
    const newUser = await pool.query("INSERT INTO users (first_name, last_name, email, password) VALUES ($1, $2, $3, $4) RETURNING *", [first_name, last_name, email, password]);
    return newUser;
  } catch(err) {
    console.log(err.message);
  }
}

module.exports = User;