require('dotenv').config();       // Load .env variables
const express = require('express');
const cors = require('cors');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());                  // Enable CORS so frontend can call backend
app.use(express.json());          // Parse JSON request bodies

// Example test route
app.get('/', (req, res) => {
  res.send('Hello from backend!');
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
