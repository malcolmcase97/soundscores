const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

// POST /api/albums
router.post('/', async (req, res) => {
  try {
    const { title, artist, rating } = req.body;

    const newAlbum = await prisma.album.create({
      data: { title, artist, rating: rating ?? null },
    });

    res.status(201).json(newAlbum);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to create album' });
  }
});

// GET /api/albums
router.get('/', async (req, res) => {
  try {
    const albums = await prisma.album.findMany();
    res.json(albums);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Failed to fetch albums' });
  }
});

module.exports = router;
