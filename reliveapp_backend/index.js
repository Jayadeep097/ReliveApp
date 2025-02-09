require('dotenv').config();
const axios = require('axios');
const admin = require('firebase-admin');
const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');
const errorHandler = require('./utils/errorHandler');

const app = express();
const PORT = process.env.PORT || 3000;

// Initialize Firebase Admin SDK
admin.initializeApp({
    credential: admin.credential.cert({
        projectId: process.env.PROJECT_ID,
        clientEmail: process.env.FIREBASE_CLIENT_EMAIL,
        privateKey: process.env.FIREBASE_PRIVATE_KEY.replace(/\\n/g, '\n'),
    }),
});
const db = admin.firestore();

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(errorHandler);

// Contribution API
app.post('/processContribution', async (req, res) => {
    try {
        const { userId, projectId, amount } = req.body;
        const projectRef = db.collection('projects').doc(projectId);
        const project = await projectRef.get();

        if (!project.exists) {
            return res.status(404).json({ error: 'Project not found' });
        }

        await projectRef.update({
            fundsRaised: admin.firestore.FieldValue.increment(amount),
            contributors: admin.firestore.FieldValue.arrayUnion(userId),
        });

        const tokens = Math.floor(amount / 10);
        const userRef = db.collection('users').doc(userId);
        await userRef.update({
            tokens: admin.firestore.FieldValue.increment(tokens),
        });

        res.status(200).json({ message: 'Contribution successful!', tokensEarned: tokens });
    } catch (error) {
        console.error('Error processing contribution:', error);
        res.status(500).json({ error: error.message });
    }
});

// Community Stats API
app.get('/getCommunityStats', async (req, res) => {
    try {
        const statsRef = db.collection('communityStats').doc('global');
        const stats = await statsRef.get();

        if (!stats.exists) {
            return res.status(404).json({ error: 'Stats not found' });
        }

        res.status(200).json(stats.data());
    } catch (error) {
        console.error('Error fetching community stats:', error);
        res.status(500).json({ error: error.message });
    }
});

// Crypto Conversion API
app.get('/convertToCrypto', async (req, res) => {
    try {
        const { amount, crypto = 'bitcoin', fiat = 'usd' } = req.query;
        const response = await axios.get(
            `https://api.coingecko.com/api/v3/simple/price?ids=${crypto}&vs_currencies=${fiat}`
        );
        const rate = response.data[crypto][fiat];
        const convertedAmount = (amount / rate).toFixed(6);

        res.status(200).json({ rate, convertedAmount });
    } catch (error) {
        console.error('Error fetching conversion rates:', error);
        res.status(500).json({ error: 'Failed to fetch conversion rates.' });
    }
});

// Sample Route
app.get('/api/data', (req, res) => {
    res.json({ message: 'Hello from the Node.js backend!' });
});

// POST Route
app.post('/api/submit', (req, res) => {
    const { data } = req.body;
    console.log('Received data:', data);
    res.status(200).json({ message: 'Data received successfully!' });
});

// Add the error handler middleware at the end of middleware stack
app.use(errorHandler);

// Start Server
app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});
