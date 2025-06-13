require('dotenv').config();       // Load .env variables to process.env
const express = require('express');
const cors = require('cors');
const { PrismaClient } = require('@prisma/client');

const app = express();
const PORT = process.env.PORT || 3000;
const prisma = new PrismaClient(); // Initialize Prisma Client

// Middleware
app.use(cors());                  // Enable CORS so frontend can call backend
app.use(express.json());          // Parse JSON request bodies

// Test route
app.get('/', (req, res) => {
  res.send('Hello from backend!');
});

// POST route
app.post('/api/albums', async (req, res) => {
  try {
    const { title, artist, rating } = req.body;

    const newAlbum = await prisma.album.create({
      data: {
        title,
        artist,
        rating: rating ?? null,
      },
    });

    res.status(201).json(newAlbum);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to create album' });
  }
});

// GET route to fetch all albums
app.get('/api/albums', async (req, res) => {
  try {
    const albums = await prisma.album.findMany();
    res.json(albums);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to fetch albums' });
  }
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
