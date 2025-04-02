const express = require('express')
const app = express()
const port = 3000

// serve static files from the frontend
app.use(express.static('public'))

// endpoint to start genymotion device
app.post('/start', (req, res) => {
  res.send('started genymotion device')
})

// start the server
app.listen(port, () => {
  console.log(`server running at http://localhost:${port}`)
})
