const express = require('express');
const bodyParser = require('body-parser');
const fs = require('fs');
const app = express();

// Middleware for parsing JSON request bodies
app.use(bodyParser.json());

// Middleware for API key authentication
function authenticate(req, res, next) {
    const apiKey = process.env.API_KEY;
    const providedKey = req.headers.api_key;

    if (providedKey && providedKey === apiKey) {
        next();
    } else {
        res.status(401).json({ error: 'Unauthorized' });
    }
}

// Read quotes from file
let quotes;
try {
    const data = fs.readFileSync('quotes.json', 'utf8');
    quotes = JSON.parse(data);
} catch (err) {
    console.error('Error reading quotes file:', err);
    quotes = [];
}

// GET API to serve a random quote/joke
app.get('/quote', authenticate, (req, res) => {
    const randomIndex = Math.floor(Math.random() * quotes.length);
    const randomQuote = quotes[randomIndex];
    res.json({ quote: randomQuote });
});

// GET API to serve the version
app.get('/version', authenticate, (req, res) => {
    const tagVersion = process.env.TAG_VERSION;
    res.json({ version: tagVersion });
});

// Starting the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
