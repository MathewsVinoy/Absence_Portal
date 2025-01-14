const connection = require("./db");

function getStudentData() {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM outpasstb WHERE state = 'pending..'",
      function (err, result, fields) {
        if (err) {
          return reject(err);
        }
        resolve(result);
      }
    );
  });
}
function getStudentDataForSec() {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM outpasstb WHERE state = 'accepted' AND outstatus = 'pending..' ",
      function (err, result, fields) {
        if (err) {
          return reject(err);
        }
        resolve(result);
      }
    );
  });
}
function getStudentDataForSecAcc() {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM outpasstb WHERE state = 'accepted' AND outstatus = 'accepted' ",
      function (err, result, fields) {
        if (err) {
          return reject(err);
        }
        resolve(result);
      }
    );
  });
}
function studentRequiest(adno) {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM outpasstb WHERE admno = ? ",
      [adno],
      function (err, result, fields) {
        if (err) {
          return reject(err);
        }
        resolve(result);
      }
    );
  });
}
function getStudentDataAcpt() {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM outpasstb WHERE state = 'accepted'",
      function (err, result, fields) {
        if (err) {
          return reject(err);
        }
        resolve(result);
      }
    );
  });
}
function getStudentDataRej() {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM outpasstb WHERE state = 'rejected'",
      function (err, result, fields) {
        if (err) {
          return reject(err);
        }
        resolve(result);
      }
    );
  });
}

module.exports = {
  getStudentData,
  getStudentDataForSec,
  studentRequiest,
  getStudentDataAcpt,
  getStudentDataRej,
  getStudentDataForSecAcc,
};
