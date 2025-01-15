const mysql = require("mysql");
require("dotenv").config();

const safe = process.env;

var connection = mysql.createConnection({
  host: safe.HOST,
  user: safe.USER,
  password: safe.PASSWORD,
  database: safe.DATABASE,
});

connection.connect(function (err) {
  if (err) throw err;
  console.log("Connected to mysql database");
});

module.exports = connection;
