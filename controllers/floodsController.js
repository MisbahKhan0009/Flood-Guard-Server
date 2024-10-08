import db from "../config/db.js";

// Create a new flood record (POST)
export function createFlood(req, res) {
  const floodData = req.body;
  const query = `INSERT INTO floods SET ?`;

  db.query(query, floodData, (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error creating flood record", error: error.message });
    }
    return res.status(201).json({
      message: "Flood record created successfully",
      flood_id: results.insertId,
    });
  });
}

// Get all flood records (GET)
export function getAllFloods(req, res) {
  const query = `SELECT * FROM floods`;

  db.query(query, (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error fetching flood records",
        error: error.message,
      });
    }
    return res.status(200).json(results);
  });
}

// Get a single flood record by ID (GET)
export function getFloodById(req, res) {
  const { id } = req.params;
  const query = `SELECT * FROM floods WHERE flood_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error fetching flood record", error: error.message });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: "Flood record not found" });
    }
    return res.status(200).json(results[0]);
  });
}

// Update a flood record by ID (PATCH)
export function updateFlood(req, res) {
  const floodData = req.body;
  const { id } = req.params;
  const query = `UPDATE floods SET ? WHERE flood_id = ?`;

  db.query(query, [floodData, id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error updating flood record", error: error.message });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Flood record not found" });
    }
    return res
      .status(200)
      .json({ message: "Flood record updated successfully" });
  });
}

// Delete a flood record by ID (DELETE)
export function deleteFlood(req, res) {
  const { id } = req.params;
  const query = `DELETE FROM floods WHERE flood_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error deleting flood record", error: error.message });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Flood record not found" });
    }
    return res
      .status(200)
      .json({ message: "Flood record deleted successfully" });
  });
}
