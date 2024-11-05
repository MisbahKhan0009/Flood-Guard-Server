import db from "../config/db.js";

export function createDeadBody(req, res) {
  const {
    image_url,
    found_location,
    found_time,
    submitted_hospital_id,
    identified,
  } = req.body;

  const sql = `
    INSERT INTO deadBodies (image_url, found_location, found_time, submitted_hospital_id, identified)
    VALUES (?, ?, ?, ?, ?)
  `;

  db.query(
    sql,
    [image_url, found_location, found_time, submitted_hospital_id, identified],
    (err, result) => {
      if (err) {
        return res.status(500).json({ message: "Database error", error: err });
      }
      res.status(201).json({
        message: "Dead body record created",
        body_id: result.insertId,
      });
    }
  );
}

export function getAllDeadBodies(req, res) {
  const {
    limit = 10,
    offset = 0,
    search = "",
    sortField = "found_time",
    sortOrder = "asc",
  } = req.query;

  const validSortOrder = ["asc", "desc"].includes(sortOrder.toLowerCase())
    ? sortOrder
    : "asc";

  const validSortFields = [
    "body_id",
    "found_location",
    "found_time",
    "submitted_hospital_id",
    "identified",
  ];

  const field = validSortFields.includes(sortField) ? sortField : "body_id";

  const searchQuery = `%${search}%`;

  const sql = `
    SELECT * FROM deadBodies 
    WHERE found_location LIKE ? 
    ORDER BY ${field} ${validSortOrder}
    LIMIT ? OFFSET ?
  `;

  db.query(
    sql,
    [searchQuery, parseInt(limit), parseInt(offset)],
    (err, results) => {
      if (err) {
        return res.status(500).json({ message: "Database error", error: err });
      }

      const countSql = `
        SELECT COUNT(*) AS totalCount FROM deadBodies 
        WHERE found_location LIKE ?
      `;

      db.query(countSql, [searchQuery], (err, countResult) => {
        if (err) {
          return res
            .status(500)
            .json({ message: "Database error", error: err });
        }

        res.status(200).json({
          deadBodies: results,
          totalCount: countResult[0].totalCount,
        });
      });
    }
  );
}

// Read a single dead body record by ID (GET)
export function getDeadBodyById(req, res) {
  const { id } = req.params;
  const query = `SELECT * FROM deadBodies WHERE body_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res.status(500).json({
        message: "Error fetching dead body record",
        error: error.message,
      });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: "Dead body record not found" });
    }
    return res.status(200).json(results[0]);
  });
}

export function updateDeadBody(req, res) {
  const { id } = req.params; // Get the ID from the URL
  const {
    image_url,
    found_location,
    found_time,
    submitted_hospital_id,
    identified,
  } = req.body;

  const sql = `
    UPDATE deadBodies
    SET image_url = ?, found_location = ?, found_time = ?, submitted_hospital_id = ?, identified = ?
    WHERE body_id = ?
  `;

  db.query(
    sql,
    [
      image_url,
      found_location,
      found_time,
      submitted_hospital_id,
      identified,
      id,
    ],
    (err, result) => {
      if (err) {
        return res.status(500).json({ message: "Database error", error: err });
      }
      if (result.affectedRows === 0) {
        return res.status(404).json({ message: "Dead body record not found" });
      }
      res.status(200).json({ message: "Dead body record updated" });
    }
  );
}

export function deleteDeadBody(req, res) {
  const { id } = req.params; // Get the ID from the URL

  const sql = `
    DELETE FROM deadBodies
    WHERE body_id = ?
  `;

  db.query(sql, [id], (err, result) => {
    if (err) {
      return res.status(500).json({ message: "Database error", error: err });
    }
    if (result.affectedRows === 0) {
      return res.status(404).json({ message: "Dead body record not found" });
    }
    res.status(204).send(); // No content
  });
}
