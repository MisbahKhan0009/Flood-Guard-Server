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

// Get all shelters with pagination, search, and sorting
export function getShelters(req, res) {
  const {
    limit = 10,
    offset = 0,
    search = "",
    sortField = "shelter_id",
    sortOrder = "asc",
  } = req.query;

  // Ensure that only valid sort orders are used
  const validSortOrder = ["asc", "desc"].includes(sortOrder.toLowerCase())
    ? sortOrder
    : "asc";

  // Define valid fields that can be sorted to prevent SQL injection
  const validSortFields = [
    "shelter_id",
    "name",
    "address_area",
    "address_upazila",
    "address_district",
    "total_population",
    "number_of_children",
    "number_of_women",
    "number_of_mothers",
  ];

  // Make sure the sortField is valid to prevent SQL injection
  const field = validSortFields.includes(sortField) ? sortField : "shelter_id";

  const searchQuery = `%${search}%`; // Prepare the search term for filtering

  // SQL query to fetch shelters based on the search term and sort order
  const sql = `
    SELECT * FROM shelters 
    WHERE name LIKE ? 
    OR address_area LIKE ? 
    OR address_upazila LIKE ? 
    OR address_district LIKE ? 
    ORDER BY ${field} ${validSortOrder} 
    LIMIT ? OFFSET ?
  `;

  // Get the list of shelters with pagination, search, and sorting
  db.query(
    sql,
    [
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
      const countSql = `
        SELECT COUNT(*) AS totalCount FROM shelters 
        WHERE name LIKE ? 
        OR address_area LIKE ? 
        OR address_upazila LIKE ? 
        OR address_district LIKE ?
      `;

      db.query(
        countSql,
        [searchQuery, searchQuery, searchQuery, searchQuery],
        (err, countResult) => {
          if (err) {
            return res
              .status(500)
              .json({ message: "Database error", error: err });
          }

          // Send back both the shelters data and the total count
          res.status(200).json({
            shelters: results,
            totalCount: countResult[0].totalCount,
          });
        }
      );
    }
  );
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
