import db from "../config/db.js";

// Create a new rescuer (POST)
export function createRescuer(req, res) {
  const rescuerData = req.body;
  const query = `INSERT INTO rescuer SET ?`;

  db.query(query, rescuerData, (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error creating rescuer", error: error.message });
    }
    return res.status(201).json({
      message: "Rescuer created successfully",
      user_id: results.insertId,
    });
  });
}

// Read all rescuers (GET)
export function getAllRescuers(req, res) {
  const query = `SELECT * FROM rescuer`;

  db.query(query, (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error fetching rescuers", error: error.message });
    }
    return res.status(200).json(results);
  });
}

// Read a single rescuer by email (GET)
export function getRescuerByEmail(req, res) {
  const { email } = req.params;
  const query = `SELECT * FROM rescuer WHERE email = ?`;

  db.query(query, [email], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error fetching rescuer", error: error.message });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: "Rescuer not found" });
    }
    return res.status(200).json(results[0]);
  });
}


// Update a rescuer by ID (PATCH)
export function updateRescuer(req, res) {
  const rescuerData = req.body;
  const { id } = req.params;
  const query = `UPDATE rescuer SET ? WHERE rescuer_id = ?`;

  db.query(query, [rescuerData, id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error updating rescuer", error: error.message });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Rescuer not found" });
    }
    return res.status(200).json({ message: "Rescuer updated successfully" });
  });
}

// Delete a rescuer by ID (DELETE)
export function deleteRescuer(req, res) {
  const { id } = req.params;
  const query = `DELETE FROM rescuer WHERE rescuer_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error deleting rescuer", error: error.message });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Rescuer not found" });
    }
    return res.status(200).json({ message: "Rescuer deleted successfully" });
  });
}
