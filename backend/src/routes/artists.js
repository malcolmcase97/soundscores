const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

// GET /api/artists - List first 20 artists
router.get('/', async (req, res) => {
  try {
    const artists = await prisma.artists.findMany({
      take: 20,
      orderBy: { id: 'asc' },
    });
    res.json(artists);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error fetching artists');
  }
});

// GET /api/artists/:id - Get specific artist (#3) with extra data
router.get('/:id', async (req, res) => {
  const id = parseInt(req.params.id);
  try {
    const artist = await prisma.artists.findUnique({
      where: { id },
      include: {
        artist_urls: true,
        artist_aliases: true,
        artist_name_variations: true,
        artist_members: true,
        artist_groups: true,
        master_artists: {
          include: {
            masters: true,
          },
        },
      },
    });

    if (!artist) return res.status(404).send('Artist not found');

    // Flatten master data for easier use in frontend
    const masters = artist.master_artists.map(ma => ma.masters);
    artist.masters = masters;
    delete artist.master_artists;

    res.json(artist);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error fetching artist');
  }
});

module.exports = router;
