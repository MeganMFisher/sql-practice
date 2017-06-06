// "massive": "3.0.0-rc1"  --New Massive Version

var massive = require('massive')

massive({
    host: 'localhost',
    port: 5432,
    database: 'massive_demo'
}).then(db => {
    app.set('db', db)
})