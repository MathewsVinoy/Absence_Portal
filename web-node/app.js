const express = require("express");
const path = require("path");
const bodyParser = require("body-parser");
const session = require("express-session");
const connection = require("./public/function/db");
require("dotenv").config();
const {
  getStudentData,
  getStudentDataForSec,
  studentRequiest,
  getStudentDataAcpt,
  getStudentDataRej,
  getStudentDataForSecAcc,
} = require("./public/function/select_std_tb");

const app = express();
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));
app.use(express.static(path.join(__dirname, "public")));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

const PORT = process.env.PORT || 3000;

// Configure session middleware
app.use(
  session({
    secret: "your_secret_key", // Replace with a secure key
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false }, // Set `true` if using HTTPS
  })
);

// Main page of starting page
app.get("/", function (req, res) {
  res.render("index");
});

// Student section
app.get("/student", function (req, res) {
  const admission_number = req.session.admission_number;
  if (!admission_number) {
    return res.status(401).send("Unauthorized: Please log in.");
  }
  res.render("student/index", { admission_number });
});

app.get("/student-requiests", async function (req, res) {
  const admission_number = req.session.admission_number;

  if (!admission_number) {
    return res.status(401).send("Unauthorized: Please log in.");
  }

  try {
    const values = await studentRequiest(admission_number);
    console.log(values); // Fetch student requests
    res.render("student/requiests", { values }); // Pass data to view
  } catch (err) {
    console.error("Error fetching requests:", err);
    res.status(500).send("Internal Server Error");
  }
});

app.get("/student-login", function (req, res) {
  res.render("student/loginpage");
});

// Staff section
app.get("/staff", async function (req, res) {
  try {
    const values = await getStudentData();
    res.render("Staff/index", { values });
  } catch (err) {
    console.error("Error fetching student data:", err);
    res.status(500).send("Internal Server Error");
  }
});
app.get("/staff-accpected", async function (req, res) {
  try {
    const values = await getStudentDataAcpt();
    res.render("Staff/accpected", { values });
  } catch (err) {
    console.error("Error fetching student data:", err);
    res.status(500).send("Internal Server Error");
  }
});
app.get("/staff-rejected", async function (req, res) {
  try {
    const values = await getStudentDataRej();
    res.render("Staff/rejected", { values });
  } catch (err) {
    console.error("Error fetching student data:", err);
    res.status(500).send("Internal Server Error");
  }
});
app.get("/staff-login", function (req, res) {
  res.render("Staff/loginpage");
});

// Security section
app.get("/security", async function (req, res) {
  try {
    const values = await getStudentDataForSec();
    res.render("security/index", { values });
  } catch (err) {
    console.error("Error fetching student data:", err);
    res.status(500).send("Internal Server Error");
  }
});
app.get("/security-accpected", async function (req, res) {
  try {
    const values = await getStudentDataForSecAcc();
    res.render("security/accpected", { values });
  } catch (err) {
    console.error("Error fetching student data:", err);
    res.status(500).send("Internal Server Error");
  }
});

app.get("/security-login", function (req, res) {
  res.render("security/loginpage");
});

// Login POST handler
app.post("/student-login", function (req, res) {
  const { admission_number, password } = req.body;
  const sql = "SELECT * FROM student WHERE username = ?";

  connection.query(sql, [admission_number], function (err, result) {
    if (err) {
      console.error("Error fetching data:", err);
      res.status(500).send("Internal Server Error");
      return;
    }
    if (result.length === 0) {
      return res.status(401).send("Invalid admission number or password");
    }

    const user = result[0];
    if (user.passward == password) {
      req.session.admission_number = admission_number; // Store in session
      console.log("Login successful for:", admission_number);
      res.redirect("/student");
    } else {
      res.status(401).send("Invalid admission number or password");
    }
  });
});

app.post("/security-login", function (req, res) {
  const { admission_number, password } = req.body;
  const sql = "SELECT * FROM student WHERE username = ?";

  connection.query(sql, [admission_number], function (err, result) {
    if (err) {
      console.error("Error fetching data:", err);
      res.status(500).send("Internal Server Error");
      return;
    }
    if (result.length === 0) {
      return res.status(401).send("Invalid admission number or password");
    }

    const user = result[0];
    if (user.passward == password) {
      req.session.admission_number = admission_number; // Store in session
      console.log("Login successful for:", admission_number);
      res.redirect("/security");
    } else {
      res.status(401).send("Invalid admission number or password");
    }
  });
});

app.post("/staff-login", function (req, res) {
  const { admission_number, password } = req.body;
  const sql = "SELECT * FROM student WHERE username = ?";

  connection.query(sql, [admission_number], function (err, result) {
    if (err) {
      console.error("Error fetching data:", err);
      res.status(500).send("Internal Server Error");
      return;
    }
    if (result.length === 0) {
      return res.status(401).send("Invalid admission number or password");
    }

    const user = result[0];
    if (user.passward == password) {
      req.session.admission_number = admission_number; // Store in session
      console.log("Login successful for:", admission_number);
      res.redirect("/staff");
    } else {
      res.status(401).send("Invalid admission number or password");
    }
  });
});

// Student submission POST handler
app.post("/student-submit", function (req, res) {
  const date = new Date();
  const { name, admission_number, class_yer, department, reason } = req.body;
  const sql =
    "INSERT INTO outpasstb (indata, name, admno, class, dept, reason) VALUES (?, ?, ?, ?, ?, ?)";
  const values = [date, name, admission_number, class_yer, department, reason];

  connection.query(sql, values, function (err, result) {
    if (err) {
      console.error("Error inserting data:", err);
      res.status(500).send("Internal Server Error");
      return;
    }
    console.log("Number of records inserted:", result.affectedRows);
    res.redirect("/student");
  });
});

// Update status by faculty
app.post("/update-status-fac", function (req, res) {
  const { id, state } = req.body;
  const sql = "UPDATE outpasstb SET state = ? WHERE id = ?";
  const values = [state, id];

  connection.query(sql, values, function (err, result) {
    if (err) {
      console.error("Error updating status:", err);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }
    console.log("Number of records updated:", result.affectedRows);
    res.status(200).json({ message: "Status updated successfully" });
  });
});

// Update status by security
app.post("/update-status-sec", function (req, res) {
  const date = new Date();
  const { id } = req.body;
  const sql = "UPDATE outpasstb SET outstatus = ?, outtime = ? WHERE id = ?";
  const values = ["accepted", date, id];

  connection.query(sql, values, function (err, result) {
    if (err) {
      console.error("Error updating status:", err);
      res.status(500).json({ error: "Internal Server Error" });
      return;
    }
    console.log("Number of records updated:", result.affectedRows);
    res.status(200).json({ message: "Status updated successfully" });
  });
});

// Logout handler
app.get("/logout", function (req, res) {
  req.session.destroy((err) => {
    if (err) {
      console.error("Error destroying session:", err);
      return res.status(500).send("Internal Server Error");
    }
    res.redirect("/");
  });
});

// Start the server
app.listen(PORT, (error) => {
  if (!error) {
    console.log(
      "Server is Successfully Running, and App is listening on port " + PORT
    );
  } else {
    console.log("Error occurred, server can't start", error);
  }
});
