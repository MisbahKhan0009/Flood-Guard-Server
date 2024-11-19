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

// Get all rescue assignments with pagination, search, and sorting
export function getAllRescueAssignments(req, res) {
  const {
    limit = 10,
    offset = 0,
    search = "",
    sortField = "rescuer_name",
    sortOrder = "asc",
  } = req.query;

  // Ensure only valid sort orders are used
  const validSortOrder = ["asc", "desc"].includes(sortOrder.toLowerCase())
    ? sortOrder
    : "asc";

  // Define valid fields that can be sorted to prevent SQL injection
  const validSortFields = [
    "rescuer_name",
    "victim_name",
    "rescue_time",
    "status",
  ];

  // Make sure the sortField is valid to prevent SQL injection
  const field = validSortFields.includes(sortField)
    ? sortField
    : "rescuer_name";

  const searchQuery = `%${search}%`; // Prepare the search term for filtering

  // SQL query to fetch rescue assignments with rescuer and victim names, using LEFT JOIN to include all assignments
  const sql = `
    SELECT 
      ra.assignment_id,  
      ra.rescue_time, 
      ra.status,
      COALESCE(r.name, 'N/A') AS rescuer_name,  -- Replace NULL with 'N/A'
      COALESCE(v.name, 'N/A') AS victim_name    -- Replace NULL with 'N/A'
    FROM rescueassignments ra
    LEFT JOIN rescuer r ON ra.rescuer_id = r.rescuer_id
    LEFT JOIN victim v ON ra.victim_id = v.victim_id
    WHERE r.name LIKE ? 
      OR v.name LIKE ? 
      OR ra.status LIKE ? 
    ORDER BY ${field} ${validSortOrder} 
    LIMIT ? OFFSET ?
  `;

  // Get the list of rescue assignments with pagination, search, and sorting
  db.query(
    sql,
    [searchQuery, searchQuery, searchQuery, parseInt(limit), parseInt(offset)],
    (err, results) => {
      if (err) {
        return res.status(500).json({ message: "Database error", error: err });
      }

      // Count the total number of matching records for pagination
      const countSql = `
        SELECT COUNT(*) AS totalCount 
        FROM rescueassignments ra
        LEFT JOIN rescuer r ON ra.rescuer_id = r.rescuer_id
        LEFT JOIN victim v ON ra.victim_id = v.victim_id
        WHERE r.name LIKE ? 
          OR v.name LIKE ? 
          OR ra.status LIKE ?
      `;

      db.query(
        countSql,
        [searchQuery, searchQuery, searchQuery],
        (err, countResult) => {
          if (err) {
            return res
              .status(500)
              .json({ message: "Database error", error: err });
          }

          // Send back both the rescue assignments data and the total count
          res.status(200).json({
            rescueAssignments: results,
            totalCount: countResult[0].totalCount,
          });
        }
      );
    }
  );
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
