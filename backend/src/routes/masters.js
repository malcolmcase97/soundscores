const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

// GET /api/masters - List first 20 masters
router.get('/', async (req, res) => {
  try {
    const masters = await prisma.masters.findMany({
      take: 20,
      orderBy: { id: 'asc' },
    });
    res.json(masters);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error fetching masters');
  }
});

// GET /api/masters/:id - Get specific master with related data
router.get('/:id', async (req, res) => {
  const id = parseInt(req.params.id);
  try {
    const master = await prisma.masters.findUnique({
      where: { id },
      include: {
        master_artists: {
          include: { artists: true }
        },
        master_genres: true,
        master_styles: true,
        master_videos: true,
      },
    });

    if (!master) return res.status(404).send('Master not found');
    res.json(master);
  } catch (err) {
    console.error(err);
    res.status(500).send('Error fetching master');
  }
});

module.exports = router;
