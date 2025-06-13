require('dotenv').config();       // Load .env variables to process.env
const express = require('express');
const cors = require('cors');
const { PrismaClient } = require('@prisma/client');

const app = express();
const PORT = process.env.PORT || 3000;
const prisma = new PrismaClient(); // Initialize Prisma Client

const albumsRouter = require('./routes/albums');

// Middleware
app.use(cors());                  // Enable CORS so frontend can call backend
app.use(express.json());          // Parse JSON request bodies

// Test route
app.get('/', (req, res) => {
  res.send('Hello from backend!');
});

// Register album routes under /api/albums
app.use('/api/albums', albumsRouter);

// Start the server
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
