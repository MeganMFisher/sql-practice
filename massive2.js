
// Postgres requires open connection.

// One file with no controllers. 

var express = require('express')
var bodyParser = require('body-parser')
var massive = require('massive')


massive({
    host: 'localhost',
    port: 5432,
    database: 'massive_demo',
    user: 'postgres',
    password: ''
}).then(db => {
    app.set('db', db)  //Express app database connection.

})


var app = express()
app.use(bodyParser.json())

var port = 3000

app.get('/endpoint', function(req, res){
    req.app.get('db').getSQLquery().then(function(query){  //req.app.get('db')
        res.send(query)
    })
})

app.listen(port)


