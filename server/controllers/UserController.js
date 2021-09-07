const User = require('../models/User');
const { comparePassword } = require('../helpers/bcrypt');
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

  static async login(req, res) {
    const { email, password } = req.body;
    try {
      const findUser = await User.login(email);
      if (findUser.rowCount > 0) {
        const loggedInUser = findUser.rows[0];
        const comparedPassword = comparePassword(password, loggedInUser.password);
        if (comparedPassword) {
          const token = generateToken({
            first_name: loggedInUser.first_name,
            last_name: loggedInUser.last_name,
            email: loggedInUser.email
          });
          res.json({
            first_name: loggedInUser.first_name,
            last_name: loggedInUser.last_name,
            email: loggedInUser.email,
            token,
            message: "Success",
          })
        } else {
          res.json({ message: "Email or password is incorrect!" });
        }
      } else {
        res.json({ message: "Email or password is incorrect!" })
      }
    } catch(err) {
      console.log(err);
    }
  }

  static async completeProfile(req, res) {
    try {
      const updatedUser = await User.completeProfile(req.params.email, req.body);
      res.json(updatedUser);
    } catch (err) {
      console.log(err);
    }
  }

  static async addGoals(req, res) {
    try {
      const updatedUser = await User.addGoals(req.params.email, req.body.goals);
      res.json(updatedUser);
    } catch (err) {
      console.log(err);
    }
  }

  static async getAllUsers(req, res) {
    try {
      const users = await User.getAllUsers();
      res.json(users);
    } catch (err) {
      console.log(err);
    }
  }
}

module.exports = UserController;