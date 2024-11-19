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

// Get all hospitals with pagination, search, and sorting
export function getAllHospitals(req, res) {
  const {
    limit = 10,
    offset = 0,
    search = "",
    sortField = "hospital_id",
    sortOrder = "asc",
  } = req.query;

  // Ensure that only valid sort orders are used
  const validSortOrder = ["asc", "desc"].includes(sortOrder.toLowerCase())
    ? sortOrder
    : "asc";

  // Define valid fields that can be sorted to prevent SQL injection
  const validSortFields = [
    "hospital_id",
    "name",
    "location",
    "bed",
    "bed_available",
  ];

  // Make sure the sortField is valid to prevent SQL injection
  const field = validSortFields.includes(sortField) ? sortField : "hospital_id";

  const searchQuery = `%${search}%`; // Prepare the search term for filtering

  // SQL query to fetch hospitals based on the search term and sort order
  const sql = `
    SELECT * FROM hospital 
    WHERE name LIKE ? 
    OR location LIKE ? 
    ORDER BY ${field} ${validSortOrder} 
    LIMIT ? OFFSET ?
  `;

  // Get the list of hospitals with pagination, search, and sorting
  db.query(
    sql,
    [searchQuery, searchQuery, parseInt(limit), parseInt(offset)],
    (err, results) => {
      if (err) {
        return res.status(500).json({ message: "Database error", error: err });
      }

      // Count the total number of matching records for pagination
      const countSql = `SELECT COUNT(*) AS totalCount FROM hospital 
        WHERE name LIKE ? 
        OR location LIKE ?`;

      db.query(countSql, [searchQuery, searchQuery], (err, countResult) => {
        if (err) {
          return res
            .status(500)
            .json({ message: "Database error", error: err });
        }

        // Send back both the hospitals data and the total count
        res.status(200).json({
          hospitals: results,
          totalCount: countResult[0].totalCount,
        });
      });
    }
  );
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
