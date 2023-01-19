const express = require('express')
const db = require('./db/model');

const app = express()
app.use(express.json())

app.listen(3000, () => console.log('Express Server is running at port 3000'));


app.post('/signup', db.signup);