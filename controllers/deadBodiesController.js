import db from "../config/db.js";

// Create a new dead body record (POST)
export function createDeadBody(req, res) {
  const deadBodyData = req.body;
  const query = `INSERT INTO deadBodies SET ?`;

  db.query(query, deadBodyData, (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error creating dead body record",
        error: error.message,
      });
    }
    return res.status(201).json({
      message: "Dead body record created successfully",
      body_id: results.insertId,
    });
  });
}

// Read all dead body records (GET)
export function getAllDeadBodies(req, res) {
  const query = `SELECT * FROM deadBodies`;

  db.query(query, (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error fetching dead body records",
        error: error.message,
      });
    }
    return res.status(200).json(results);
  });
}

// Read a single dead body record by ID (GET)
export function getDeadBodyById(req, res) {
  const { id } = req.params;
  const query = `SELECT * FROM deadBodies WHERE body_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error fetching dead body record",
        error: error.message,
      });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: "Dead body record not found" });
    }
    return res.status(200).json(results[0]);
  });
}

// Update a dead body record by ID (PATCH)
export function updateDeadBody(req, res) {
  const deadBodyData = req.body;
  const { id } = req.params;
  const query = `UPDATE deadBodies SET ? WHERE body_id = ?`;

  db.query(query, [deadBodyData, id], (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error updating dead body record",
        error: error.message,
      });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Dead body record not found" });
    }
    return res
      .status(200)
      .json({ message: "Dead body record updated successfully" });
  });
}

// Delete a dead body record by ID (DELETE)
export function deleteDeadBody(req, res) {
  const { id } = req.params;
  const query = `DELETE FROM deadBodies WHERE body_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error deleting dead body record",
        error: error.message,
      });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Dead body record not found" });
    }
    return res
      .status(200)
      .json({ message: "Dead body record deleted successfully" });
  });
}
