import db from "../config/db.js";

// Create a new emergency alert (POST)
export function createEmergencyAlert(req, res) {
  const alertData = req.body;
  const query = `INSERT INTO emergencyalerts SET ?`;

  db.query(query, alertData, (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error creating emergency alert",
        error: error.message,
      });
    }
    return res.status(201).json({
      message: "Emergency alert created successfully",
      alert_id: results.insertId,
    });
  });
}

// Get all emergency alerts (GET)
export function getAllEmergencyAlerts(req, res) {
  const query = `SELECT * FROM emergencyalerts`;

  db.query(query, (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error fetching emergency alerts",
        error: error.message,
      });
    }
    return res.status(200).json(results);
  });
}

// Get a single emergency alert by ID (GET)
export function getEmergencyAlertById(req, res) {
  const { id } = req.params;
  const query = `SELECT * FROM emergencyalerts WHERE alert_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error fetching emergency alert",
        error: error.message,
      });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: "Emergency alert not found" });
    }
    return res.status(200).json(results[0]);
  });
}

// Update an emergency alert by ID (PATCH)
export function updateEmergencyAlert(req, res) {
  const alertData = req.body;
  const { id } = req.params;
  const query = `UPDATE emergencyalerts SET ? WHERE alert_id = ?`;

  db.query(query, [alertData, id], (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error updating emergency alert",
        error: error.message,
      });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Emergency alert not found" });
    }
    return res
      .status(200)
      .json({ message: "Emergency alert updated successfully" });
  });
}

// Delete an emergency alert by ID (DELETE)
export function deleteEmergencyAlert(req, res) {
  const { id } = req.params;
  const query = `DELETE FROM emergencyalerts WHERE alert_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error deleting emergency alert",
        error: error.message,
      });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Emergency alert not found" });
    }
    return res
      .status(200)
      .json({ message: "Emergency alert deleted successfully" });
  });
}
