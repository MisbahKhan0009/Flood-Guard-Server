import db from "../config/db.js";

// Create a new rescue assignment (POST)
export function createRescueAssignment(req, res) {
  const assignmentData = req.body;
  const query = `INSERT INTO rescueassignments SET ?`;

  db.query(query, assignmentData, (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error creating rescue assignment",
        error: error.message,
      });
    }
    return res.status(201).json({
      message: "Rescue assignment created successfully",
      assignment_id: results.insertId,
    });
  });
}

// Read all rescue assignments (GET)
export function getAllRescueAssignments(req, res) {
  const query = `SELECT * FROM rescueassignments`;

  db.query(query, (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error fetching rescue assignments",
        error: error.message,
      });
    }
    return res.status(200).json(results);
  });
}

// Read a single rescue assignment by ID (GET)
export function getRescueAssignmentById(req, res) {
  const { id } = req.params;
  const query = `SELECT * FROM rescueassignments WHERE assignment_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error fetching rescue assignment",
        error: error.message,
      });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: "Rescue assignment not found" });
    }
    return res.status(200).json(results[0]);
  });
}

// Update a rescue assignment by ID (PATCH)
export function updateRescueAssignment(req, res) {
  const assignmentData = req.body;
  const { id } = req.params;
  const query = `UPDATE rescueassignments SET ? WHERE assignment_id = ?`;

  db.query(query, [assignmentData, id], (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error updating rescue assignment",
        error: error.message,
      });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Rescue assignment not found" });
    }
    return res
      .status(200)
      .json({ message: "Rescue assignment updated successfully" });
  });
}

// Delete a rescue assignment by ID (DELETE)
export function deleteRescueAssignment(req, res) {
  const { id } = req.params;
  const query = `DELETE FROM rescueassignments WHERE assignment_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error deleting rescue assignment",
        error: error.message,
      });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Rescue assignment not found" });
    }
    return res
      .status(200)
      .json({ message: "Rescue assignment deleted successfully" });
  });
}
