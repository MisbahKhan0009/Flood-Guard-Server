import db from "../config/db.js";

// Create a new hospital (POST)
export function createHospital(req, res) {
  const hospitalData = req.body;
  const query = `INSERT INTO hospital SET ?`;

  db.query(query, hospitalData, (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error creating hospital", error: error.message });
    }
    return res.status(201).json({
      message: "Hospital created successfully",
      hospital_id: results.insertId,
    });
  });
}

// Get all hospitals (GET)
export function getAllHospitals(req, res) {
  const query = `SELECT * FROM hospital`;

  db.query(query, (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error fetching hospitals", error: error.message });
    }
    return res.status(200).json(results);
  });
}

// Get a hospital by ID (GET)
export function getHospitalById(req, res) {
  const { id } = req.params;
  const query = `SELECT * FROM hospital WHERE hospital_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error fetching hospital", error: error.message });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: "Hospital not found" });
    }
    return res.status(200).json(results[0]);
  });
}

// Update a hospital by ID (PUT)
export function updateHospital(req, res) {
  const hospitalData = req.body;
  const { id } = req.params;
  const query = `UPDATE hospital SET ? WHERE hospital_id = ?`;

  db.query(query, [hospitalData, id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error updating hospital", error: error.message });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Hospital not found" });
    }
    return res.status(200).json({ message: "Hospital updated successfully" });
  });
}

// Delete a hospital by ID (DELETE)
export function deleteHospital(req, res) {
  const { id } = req.params;
  const query = `DELETE FROM hospital WHERE hospital_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error deleting hospital", error: error.message });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Hospital not found" });
    }
    return res.status(200).json({ message: "Hospital deleted successfully" });
  });
}
