const express = require('express');
const app = express();
const port = 3000;

// serve static files from frontend
app.use(express.static('frontend'));

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});
