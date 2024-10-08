import db from "../config/db.js";

// Create a new hydro level map record (POST)
export function createHydroLevelMap(req, res) {
  const mapData = req.body; // Take all data from req.body
  const query = `INSERT INTO hydrolevelmap SET ?`;

  db.query(query, mapData, (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({
          message: "Error creating hydro level map",
          error: error.message,
        });
    }
    return res.status(201).json({
      message: "Hydro level map created successfully",
      map_id: results.insertId,
    });
  });
}

// Get all hydro level maps (GET)
export function getAllHydroLevelMaps(req, res) {
  const query = `SELECT * FROM hydrolevelmap`;

  db.query(query, (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({
          message: "Error fetching hydro level maps",
          error: error.message,
        });
    }
    return res.status(200).json(results);
  });
}

// Get a hydro level map by ID (GET)
export function getHydroLevelMapById(req, res) {
  const { id } = req.params;
  const query = `SELECT * FROM hydrolevelmap WHERE map_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({
          message: "Error fetching hydro level map",
          error: error.message,
        });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: "Hydro level map not found" });
    }
    return res.status(200).json(results[0]);
  });
}

// Update a hydro level map by ID (PATCH)
export function updateHydroLevelMap(req, res) {
  const mapData = req.body;
  const { id } = req.params;
  const query = `UPDATE hydrolevelmap SET ? WHERE map_id = ?`;

  db.query(query, [mapData, id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({
          message: "Error updating hydro level map",
          error: error.message,
        });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Hydro level map not found" });
    }
    return res
      .status(200)
      .json({ message: "Hydro level map updated successfully" });
  });
}

// Delete a hydro level map by ID (DELETE)
export function deleteHydroLevelMap(req, res) {
  const { id } = req.params;
  const query = `DELETE FROM hydrolevelmap WHERE map_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({
          message: "Error deleting hydro level map",
          error: error.message,
        });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Hydro level map not found" });
    }
    return res
      .status(200)
      .json({ message: "Hydro level map deleted successfully" });
  });
}
