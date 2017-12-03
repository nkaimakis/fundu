//ES6 Destructuring, didn't know you destructure a constructor from an object
const { Client } = require('pg')
const express = require('express')
const crypto = require('crypto')
const parser = require('body-parser')
const jwt = require('jsonwebtoken')
const fs = require('fs')

//Global environment object, get context and listen
const db = new Client({
  connectionString: process.env.DATABASE_URL,
  ssl: true,
})

const app = express()
app.use(parser.json())
app.listen(process.env.PORT)

db.connect()

function hash(text, salt) {
  const algo = crypto.createHash('sha512')
  algo.update(text)
  algo.update(salt)
  return algo.digest('hex')
}

function get_secret() {
  return fs.readFileSync('private.key')
}

function get_token(payload) {
  return jwt.sign(payload, get_secret())
}

//If routes become complex we can modularize into files and create routers
//which are in turn exported and 'used' by the main express app
app.post('/login', function(request, response) {
  let email = request.body.email
  let password = hash(request.body.password, get_secret())
  //Dollar signs are argument interpolation
  let query = 'select id from users where email=$1 and password=$2'
  db.query(query, [email, password], (err, res) => {
    if (err) {
      console.log(err)
      return
    }
    if (res.rows.length > 0) {
      let token = get_token({id: res.rows[0].id})
      response.status(200).json({session: token})
    } else {
      response.status(200).json({session: ''})
    }
  })
})

app.post('/register', function(request, response) {
  let email = request.body.email
  let password = hash(request.body.password, get_secret())
  let query = 'insert into users (email, password) values ($1, $2)'
  db.query(query, [email, password], (err, res) => {
    if (err) {
      console.log(err)
      response.status(200).json({success: false})
    }
    response.status(200).json({success: true})
  })
})
