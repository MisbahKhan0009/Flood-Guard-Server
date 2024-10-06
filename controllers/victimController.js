import db from "../config/db.js";

// Get all victims (GET)
export function getAllVictims(req, res) {
  const sql = "SELECT * FROM victim";
  db.query(sql, (err, results) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: "No victims found" });
    }
    res.status(200).json(results);
  });
}

// Get a single victim by ID (GET)
export function getVictimById(req, res) {
  const sql = "SELECT * FROM victim WHERE NID = ?";
  db.query(sql, [req.params.id], (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    }
    if (result.length === 0) {
      return res.status(404).json({ message: "Victim not found" });
    }
    res.status(200).json(result[0]);
  });
}

// Create victim (POST)
export function createVictim(req, res) {
  const victim = req.body;
  const sql = "INSERT INTO victim SET ?";
  db.query(sql, victim, (err, result) => {
    if (err) {
      return res
        .status(500)
        .json({ message: "Error creating victim", error: err });
    }
    res
      .status(201)
      .json({ message: "Victim profile created", victimId: result.insertId });
  });
}

// Update victim by ID (PUT)
export function updateVictim(req, res) {
  const sql = "UPDATE victim SET ? WHERE NID = ?";
  db.query(sql, [req.body, req.params.id], (err, result) => {
    if (err) {
      return res
        .status(500)
        .json({ message: "Error updating victim", error: err });
    }
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Victim not found" });
    }
    res.status(200).json({ message: "Victim profile updated" });
  });
}

// Delete victim by ID (DELETE)
export function deleteVictim(req, res) {
  const sql = "DELETE FROM victim WHERE NID = ?";
  db.query(sql, [req.params.id], (err, result) => {
    if (err) {
      return res
        .status(500)
        .json({ message: "Error deleting victim", error: err });
    }
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Victim not found" });
    }
    res.status(200).json({ message: "Victim profile deleted" });
  });
}
