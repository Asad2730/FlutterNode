const express = require('express')
const db = require('./db/model');

const app = express()
app.use(express.json())

app.listen(3000, "0.0.0.0", () => console.log('Express Server is running at port 3000'));

app.get('/login/:email/:password', db.login)
app.post('/signup', db.signup);

app.get('/getData/:uid', db.getData);
app.post('/postData', db.postData);

app.delete('/deletePost/:id', db.deleteData);
