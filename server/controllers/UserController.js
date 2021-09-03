const User = require('../models/User');
const { comparePassword } = require('../helpers/jwt');
const { generateToken } = require('../helpers/jwt');

class UserController {
  static async register(req, res) {
    try {
      const newUser = await User.register(req.body);
      res.json(newUser.rows[0]);
    } catch (err) {
      console.log(err);
    }
  }

  static async completeProfile(req, res) {
    try {
      const updatedUser = await User.completeProfile(req.params.email, req.body);
      res.json(updatedUser);
    } catch(err) {
      console.log(err);
    }
  }

  static async getAllUsers(req, res) {
    try {
      const users = await User.getAllUsers();
      res.json(users);
    } catch(err) {
      console.log(err);
    }
  }
}

module.exports = UserController;