import db from "../config/db.js";

// Create a new shelter (POST)
export function createShelter(req, res) {
  const shelterData = req.body;
  const sql = "INSERT INTO shelters SET ?";

  db.query(sql, shelterData, (err, result) => {
    if (err) return res.status(500).json({ error: err.message });

    res.status(201).json({
      message: "Shelter created successfully",
      shelter_id: result.insertId,
    });
  });
}

// Get all shelters (GET)
export function getShelters(req, res) {
  const sql = "SELECT * FROM shelters";

  db.query(sql, (err, results) => {
    if (err) throw err;
    res.status(200).json(results);
  });
}

// Get a single shelter by ID (GET)
export function getShelterById(req, res) {
  const sql = "SELECT * FROM shelters WHERE shelter_id = ?";

  db.query(sql, [req.params.id], (err, result) => {
    if (err) throw err;
    if (result.length === 0) {
      return res.status(404).json({ message: "Shelter not found" });
    }
    res.status(200).json(result[0]);
  });
}

// Update a shelter by ID (PUT)
export function updateShelter(req, res) {
  const sql = "UPDATE shelters SET ? WHERE shelter_id = ?";

  db.query(sql, [req.body, req.params.id], (err, result) => {
    if (err) throw err;
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Shelter not found" });
    }
    res.status(200).json({ message: "Shelter updated successfully" });
  });
}

// Delete a shelter by ID (DELETE)
export function deleteShelter(req, res) {
  const sql = "DELETE FROM shelters WHERE shelter_id = ?";

  db.query(sql, [req.params.id], (err, result) => {
    if (err) throw err;
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Shelter not found" });
    }
    res.status(200).json({ message: "Shelter deleted successfully" });
  });
}
