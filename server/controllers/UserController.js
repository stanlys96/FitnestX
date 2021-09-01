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
}

module.exports = UserController;