const express = require("express");
const db = require("../config/db");
const admin = require("../config/firebase");

const router = express.Router();

// Get all users
router.get("/users", (req, res) => {
  db.query("SELECT * FROM users", (err, results) => {
    if (err) {
      return res.status(500).json({ error: "Database query failed" });
    }
    res.status(200).json(results);
  });
});

// Create a new user
router.post("/users", (req, res) => {
  const { name, email } = req.body;
  db.query(
    "INSERT INTO users (name, email) VALUES (?, ?)",
    [name, email],
    (err, results) => {
      if (err) {
        return res.status(500).json({ error: "Failed to create user" });
      }
      res.status(201).json({ message: "User created", id: results.insertId });
    }
  );
});

module.exports = router;
