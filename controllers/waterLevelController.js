import db from "../config/db.js";

// Create a new water level record (POST)
export function createWaterLevel(req, res) {
  const waterLevelData = req.body; // Take all data from req.body
  const query = `INSERT INTO waterlevels SET ?`;

  db.query(query, waterLevelData, (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error creating water level", error: error.message });
    }
    return res.status(201).json({
      message: "Water level created successfully",
      water_level_id: results.insertId,
    });
  });
}

// Get all water levels (GET)
export function getAllWaterLevels(req, res) {
  const query = `SELECT * FROM waterlevels`;

  db.query(query, (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error fetching water levels", error: error.message });
    }
    return res.status(200).json(results);
  });
}

// Get a water level by ID (GET)
export function getWaterLevelById(req, res) {
  const { id } = req.params;
  const query = `SELECT * FROM waterlevels WHERE water_level_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error fetching water level", error: error.message });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: "Water level not found" });
    }
    return res.status(200).json(results[0]);
  });
}

// Update a water level by ID (PATCH)
export function updateWaterLevel(req, res) {
  const waterLevelData = req.body;
  const { id } = req.params;
  const query = `UPDATE waterlevels SET ? WHERE water_level_id = ?`;

  db.query(query, [waterLevelData, id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error updating water level", error: error.message });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Water level not found" });
    }
    return res
      .status(200)
      .json({ message: "Water level updated successfully" });
  });
}

// Delete a water level by ID (DELETE)
export function deleteWaterLevel(req, res) {
  const { id } = req.params;
  const query = `DELETE FROM waterlevels WHERE water_level_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error deleting water level", error: error.message });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Water level not found" });
    }
    return res
      .status(200)
      .json({ message: "Water level deleted successfully" });
  });
}
