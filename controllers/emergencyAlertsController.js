import db from "../config/db.js";

// Create a new emergency alert (POST)
export function createEmergencyAlert(req, res) {
  const alertData = req.body;
  const query = `INSERT INTO emergencyalerts SET ?`;

  db.query(query, alertData, (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error creating emergency alert",
        error: error.message,
      });
    }
    return res.status(201).json({
      message: "Emergency alert created successfully",
      alert_id: results.insertId,
    });
  });
}

// Get all emergency alerts with pagination, search, and sorting
export function getAllEmergencyAlerts(req, res) {
  const {
    limit = 10,
    offset = 0,
    search = "",
    sortField = "alert_id",
    sortOrder = "asc",
  } = req.query;

  // Ensure that only valid sort orders are used
  const validSortOrder = ["asc", "desc"].includes(sortOrder.toLowerCase())
    ? sortOrder
    : "asc";

  const validSortFields = [
    "alert_id",
    "victim_id",
    "alert_time",
    "latitude",
    "longitude",
    "message",
  ]; // Only allow sorting by these fields

  // Make sure the sortField is valid to prevent SQL injection
  const field = validSortFields.includes(sortField) ? sortField : "alert_id";

  const searchQuery = `%${search}%`; // Prepare the search term

  // SQL query to fetch emergency alerts with the victim's name
  const sql = `
    SELECT 
      ea.alert_id,
      ea.victim_id,
      ea.alert_time,
      ea.latitude,
      ea.longitude,
      ea.message,
      COALESCE(v.name, 'Unknown') AS victim_name
    FROM emergencyalerts ea
    LEFT JOIN victim v ON ea.victim_id = v.victim_id
    WHERE ea.message LIKE ? 
    OR v.name LIKE ?
    ORDER BY ${field} ${validSortOrder}
    LIMIT ? OFFSET ?
  `;

  // Execute the main query to get the paginated emergency alerts
  db.query(
    sql,
    [searchQuery, searchQuery, parseInt(limit), parseInt(offset)],
    (err, results) => {
      if (err) {
        return res.status(500).json({ message: "Database error", error: err });
      }

      // SQL query to count the total number of matching records
      const countSql = `
        SELECT COUNT(*) AS totalCount
        FROM emergencyalerts ea
        LEFT JOIN victim v ON ea.victim_id = v.victim_id
        WHERE ea.message LIKE ?
        OR v.name LIKE ?
      `;

      // Execute the count query for pagination
      db.query(countSql, [searchQuery, searchQuery], (err, countResult) => {
        if (err) {
          return res
            .status(500)
            .json({ message: "Database error", error: err });
        }

        // Send back both the alerts data and the total count
        res.status(200).json({
          alerts: results,
          totalCount: countResult[0].totalCount,
        });
      });
    }
  );
}

// Get a single emergency alert by ID (GET)
export function getEmergencyAlertById(req, res) {
  const { id } = req.params;
  const query = `SELECT * FROM emergencyalerts WHERE alert_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error fetching emergency alert",
        error: error.message,
      });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: "Emergency alert not found" });
    }
    return res.status(200).json(results[0]);
  });
}

// Update an emergency alert by ID (PATCH)
export function updateEmergencyAlert(req, res) {
  const alertData = req.body;
  const { id } = req.params;
  const query = `UPDATE emergencyalerts SET ? WHERE alert_id = ?`;

  db.query(query, [alertData, id], (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error updating emergency alert",
        error: error.message,
      });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Emergency alert not found" });
    }
    return res
      .status(200)
      .json({ message: "Emergency alert updated successfully" });
  });
}

// Delete an emergency alert by ID (DELETE)
export function deleteEmergencyAlert(req, res) {
  const { id } = req.params;
  const query = `DELETE FROM emergencyalerts WHERE alert_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error deleting emergency alert",
        error: error.message,
      });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Emergency alert not found" });
    }
    return res
      .status(200)
      .json({ message: "Emergency alert deleted successfully" });
  });
}
