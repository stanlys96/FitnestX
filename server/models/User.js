const pool = require('../database/db');
const { hashPassword, comparePassword } = require('../helpers/bcrypt');
const { generateToken } = require('../helpers/jwt');

class User {
  static async register(user) {
    let { first_name, last_name, email, password } = user;
    password = hashPassword(password);
    const newUser = await pool.query("INSERT INTO users (first_name, last_name, email, password) VALUES ($1, $2, $3, $4) RETURNING *", [first_name, last_name, email, password]);
    return newUser;
  } catch(err) {
    console.log(err.message);
  }

  static async login(user) {
    let { email, password } = user;
    const findUser = await pool.query("SELECT * FROM users WHERE email = $1 RETURNING*;", [email]);
    return findUser;
  }

  static async completeProfile(email, user) {
    try {
      let { gender, date_of_birth, weight, height } = user;
      const updateUser = await pool.query("UPDATE users SET gender = $1, date_of_birth = $2, weight = $3, height = $4 WHERE email = $5 RETURNING *;", [gender, date_of_birth, weight, height, email]);
      return updateUser;
    } catch (err) {
      console.log(err.message);
    }
  }

  static async addGoals(email, goals) {
    try {
      const updateUser = await pool.query("UPDATE users SET goals = $1 WHERE email = $2 RETURNING *;", [goals, email]);
      return updateUser;
    } catch (err) {
      console.log(err.message);
    }
  }

  static async getAllUsers() {
    const users = await pool.query("SELECT * FROM users");
    return users;
  }
}

module.exports = User;