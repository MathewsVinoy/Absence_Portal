const mysql = require("mysql");
require("dotenv").config();

var connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "outpass1",
});

connection.connect(function (err) {
  if (err) throw err;
  console.log("Connected to mysql database");
});

module.exports = connection;
