var mysql = require('mysql');

var database = mysql.createConnection({
    host: "localhost",
    user: "admin",
    password: "hola1234",
    database: "sushin_gada"
});

database.connect(function(err) {
    if (err) throw err;
    else console.log("Database connection successful!");
});

module.exports = database;