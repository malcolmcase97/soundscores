require('dotenv').config();       // Load .env variables to process.env
const express = require('express');
const Discogs = require('disconnect').Client; // Import Discogs client
const cors = require('cors');
const { PrismaClient } = require('@prisma/client');

const app = express();
const PORT = process.env.PORT || 3000;
const prisma = new PrismaClient(); // Initialize Prisma Client

const albumsRouter = require('./routes/albums');

const oAuth = new Discogs({
  consumerKey: process.env.CONSUMER_KEY,
  consumerSecret: process.env.CONSUMER_SECRET,
  userAgent: process.env.USER_AGENT,
}).oauth();

const tokenStore = {}; // Temporary store for tokens (use a real DB in production)

// Middleware
app.use(cors());                  // Enable CORS so frontend can call backend
app.use(express.json());          // Parse JSON request bodies

// Test route
app.get('/', (req, res) => {
  res.send('Hello from backend!');
});

// OAuth authentication route
app.get('/auth', (req, res) => {
  console.log('🔁 /auth hit');
  oAuth.getRequestToken(
    process.env.CALLBACK_URL,
    (err, requestData) => {
      if (err) {
        console.error('Request Token Error:', err);
        return res.status(500).send('Error getting request token');
      }
      // Store token secret in session or temp store for later
      console.log('✅ Got Request Token:', requestData);
      tokenStore[requestData.oauth_token] = requestData.oauth_token_secret;

      res.redirect(requestData.authorizeUrl);
    }
  );
});

app.get('/callback', (req, res) => {
  const { oauth_token, oauth_verifier } = req.query;

  oAuth.getAccessToken(
    oauth_token,
    oauth_token_secret,
    oauth_verifier,
    (err, accessData) => {
      if (err) {
        console.error('Access Token Error:', err);
        return res.status(500).send('Error getting access token');
      }

      console.log('✅ Access Token:', accessData.oauth_token);
      console.log('✅ Access Token Secret:', accessData.oauth_token_secret);

      // For real apps: Store these in your DB linked to the user

      // Test identity endpoint
      const authedClient = new Discogs({
        consumerKey: process.env.CONSUMER_KEY,
        consumerSecret: process.env.CONSUMER_SECRET,
        accessToken: accessData.oauth_token,
        accessTokenSecret: accessData.oauth_token_secret,
        userAgent: process.env.USER_AGENT,
      });

      authedClient.getIdentity((err, identity) => {
        if (err) return res.status(500).send('Error fetching identity');
        res.send(`Logged in as ${identity.username}`);
      });
    }
  );
});

// Register album routes under /api/albums
app.use('/api/albums', albumsRouter);

// Start the server
app.listen(PORT, () => {
  console.log(`Visit http://localhost:${PORT}/auth to begin OAuth flow`);
});

