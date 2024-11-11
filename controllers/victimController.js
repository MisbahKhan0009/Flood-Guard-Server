import db from "../config/db.js";

// Get all victims with pagination, search, and sorting
export function getAllVictims(req, res) {
  const {
    limit = 10,
    offset = 0,
    search = "",
    sortField = "id",
    sortOrder = "asc",
  } = req.query;

  // Ensure that only valid sort orders are used
  const validSortOrder = ["asc", "desc"].includes(sortOrder.toLowerCase())
    ? sortOrder
    : "asc";
  const validSortFields = [
    "victim_id",
    "name",
    "age",
    "gender",
    "location",
    "danger_level",
    "rescue_status",
    "health_status",
  ]; // Only allow sorting by these fields

  // Make sure the sortField is valid to prevent SQL injection
  const field = validSortFields.includes(sortField)
    ? sortField
    : "danger_level";

  const searchQuery = `%${search}%`; // Prepare the search term

  // SQL query to fetch victims based on the search term and sort order
  const sql = `
      SELECT * FROM victim 
      WHERE name LIKE ? 
      OR address_area LIKE ? 
      OR danger_level LIKE ? 
      OR rescue_status LIKE ? 
      OR health_status LIKE ? 
      ORDER BY ${field} ${validSortOrder} 
      LIMIT ? OFFSET ?
  `;

  // Get the list of victims with pagination, search, and sorting
  db.query(
    sql,
    [
      searchQuery,
      searchQuery,
      searchQuery,
      searchQuery,
      searchQuery,
      parseInt(limit),
      parseInt(offset),
    ],
    (err, results) => {
      if (err) {
        return res.status(500).json({ message: "Database error", error: err });
      }

      // Count the total number of matching records for pagination
      const countSql = `SELECT COUNT(*) AS totalCount FROM victim 
        WHERE name LIKE ? 
        OR address_area LIKE ? 
        OR danger_level LIKE ? 
        OR rescue_status LIKE ? 
        OR health_status LIKE ?`;

      db.query(
        countSql,
        [searchQuery, searchQuery, searchQuery, searchQuery, searchQuery],
        (err, countResult) => {
          if (err) {
            return res
              .status(500)
              .json({ message: "Database error", error: err });
          }

          // Send back both the victims data and the total count
          res.status(200).json({
            victims: results,
            totalCount: countResult[0].totalCount,
          });
        }
      );
    }
  );
}

// Get a single victim by email (GET)
export function getVictimByEmail(req, res) {
  const sql = "SELECT * FROM victim WHERE email = ?";
  db.query(sql, [req.params.email], (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    }
    if (result.length === 0) {
      return res.status(404).json({ message: "Victim not found" });
    }
    res.status(200).json(result[0]);
  });
}

// Create victim (POST)
export function createVictim(req, res) {
  const victim = req.body;
  const sql = "INSERT INTO victim SET ?";
  db.query(sql, victim, (err, result) => {
    if (err) {
      return res
        .status(500)
        .json({ message: "Error creating victim", error: err });
    }
    res
      .status(201)
      .json({ message: "Victim profile created", user_id: result.insertId });
  });
}

// Update victim by ID (PATCH)
export function updateVictim(req, res) {
  const victimData = req.body;
  const { id } = req.params;
  const query = "UPDATE victim SET ? WHERE victim_id = ?";

  db.query(query, [victimData, id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error updating victim", error: error.message });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Victim not found" });
    }
    return res.status(200).json({ message: "Victim updated successfully" });
  });
}

// Delete victim by ID (DELETE)
export function deleteVictim(req, res) {
  const sql = "DELETE FROM victim WHERE victim_id = ?";
  db.query(sql, [req.params.id], (err, result) => {
    if (err) {
      return res
        .status(500)
        .json({ message: "Error deleting victim", error: err });
    }
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Victim not found" });
    }
    res.status(200).json({ message: "Victim profile deleted" });
  });
}
