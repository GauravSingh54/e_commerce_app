const express = require('express');
const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const cookieParser = require('cookie-parser');
const app = express();

// Middleware
app.use(express.json());
app.use(cookieParser());

// Connect to MongoDB
mongoose.connect('mongodb://localhost:27017/authdemo', {
  useNewUrlParser: true,
  useUnifiedTopology: true
});

// User model
const User = mongoose.model('User', new mongoose.Schema({
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true }
}));

// JWT Secret
const JWT_SECRET = 'your_jwt_secret_key';

// Routes

// Register
app.post('/register', async (req, res) => {
  const { email, password } = req.body;
  const hashedPassword = await bcrypt.hash(password, 10);
  try {
    const newUser = new User({ email, password: hashedPassword });
    await newUser.save();
    res.status(201).send('User registered');
  } catch (err) {
    res.status(400).send('User already exists');
  }
});

// Login
app.post('/login', async (req, res) => {
  const { email, password } = req.body;
  const user = await User.findOne({ email });
  if (!user) {
    return res.status(400).send('User not found');
  }
  const isMatch = await bcrypt.compare(password, user.password);
  if (!isMatch) {
    return res.status(400).send('Invalid credentials');
  }
  const token = jwt.sign({ id: user._id }, JWT_SECRET, { expiresIn: '1h' });
  res.cookie('token', token, { httpOnly: true }).send('Logged in');
});

// Get user info
app.get('/me', (req, res) => {
  const token = req.cookies.token;
  if (!token) return res.status(401).send('Unauthorized');
  try {
    const user = jwt.verify(token, JWT_SECRET);
    res.send(user);
  } catch {
    res.status(401).send('Unauthorized');
  }
});

// Logout
app.post('/logout', (req, res) => {
  res.clearCookie('token').send('Logged out');
});

app.listen(3000, () => {
  console.log('Server started on http://localhost:3000');
});
