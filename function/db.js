const mysql = require("mysql");

var connection = mysql.createConnection({
    host: "localhost",
    user:"root",
    password:"",
    database: "outpass"
});

connection.connect(function(err){
    if(err) throw err;
    console.log("Connected to mysql database");
});

module.exports =connection;