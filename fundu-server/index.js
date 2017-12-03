const { Client } = require('pg')
const express = require('express')

const db = new Client({
  connectionString: process.env.DATABASE_URL,
  ssl: true,
})

const app = express()
app.listen(process.env.PORT)

db.connect()

/*db.query('', (err, res) => {
  if (err) throw err
  for (let row of res.rows) {
    console.log(JSON.stringify(row))
  }
  db.end()
})*/

app.get("/hello", function(req, res) {
  res.status(200).json({hi: 2})
})
