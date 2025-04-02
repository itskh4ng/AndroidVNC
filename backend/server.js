const express = require('express');
const cors = require('cors');
const app = express();

// enable cors
app.use(cors());

// route check
app.get('/status', (req, res) => {
    res.json({ message: 'works' });
});

// start server
app.listen(3000, () => {
    console.log('running on port 3000');
});
