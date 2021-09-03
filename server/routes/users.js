const express = require('express');
const router = express.Router();
const UserController = require('../controllers/UserController');

router.post('/register', UserController.register);
router.post('/completeProfile/:email', UserController.completeProfile);
router.get('/getAll', UserController.getAllUsers);

module.exports = router;