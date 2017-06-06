// "massive": "3.0.0-rc1"  --New Massive Version

// massive takes your sql query and turns it into a JS function that you can then invoke and get back a response from postgres. 



var express = require('express')
var massive = require('massive')
var bodyParser = require('body-parser')

var conn = null

massive({
    host: 'localhost',
    port: 5432,
    database: 'massive_demo',
    user: 'postgres',
    password: ''
}).then(db => {
    app.set('db', db)
    conn = db
})

var app = express()
app.use(bodyParser.json())

var port = 3000

app.get('/endpoint', function(req, res){
    console.log(conn)
})


app.listen(port)