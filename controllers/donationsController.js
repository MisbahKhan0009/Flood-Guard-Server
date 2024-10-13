import db from "../config/db.js";

// Create a new donation (POST)
export function createDonation(req, res) {
  const donationData = req.body;
  const query = `INSERT INTO donations SET ?`;

  db.query(query, donationData, (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error creating donation", error: error.message });
    }
    return res.status(201).json({
      message: "Donation created successfully",
      donation_id: results.insertId,
    });
  });
}

// Get all donations with pagination, search, and sorting
export function getAllDonations(req, res) {
  const {
    limit = 10,
    offset = 0,
    search = "",
    sortField = "donation_id",
    sortOrder = "asc",
  } = req.query;

  // Ensure that only valid sort orders are used
  const validSortOrder = ["asc", "desc"].includes(sortOrder.toLowerCase())
    ? sortOrder
    : "asc";

  // Define valid fields that can be sorted to prevent SQL injection
  const validSortFields = [
    "donation_id",
    "donor_name",
    "donation_type",
    "quantity",
    "date_received",
  ];

  // Make sure the sortField is valid to prevent SQL injection
  const field = validSortFields.includes(sortField) ? sortField : "donation_id";

  const searchQuery = `%${search}%`; // Prepare the search term for filtering

  // SQL query to fetch donations based on the search term and sort order
  const sql = `
    SELECT * FROM donations 
    WHERE donor_name LIKE ? 
    OR donation_type LIKE ? 
    OR notes LIKE ? 
    ORDER BY ${field} ${validSortOrder} 
    LIMIT ? OFFSET ?
  `;

  // Get the list of donations with pagination, search, and sorting
  db.query(
    sql,
    [searchQuery, searchQuery, searchQuery, parseInt(limit), parseInt(offset)],
    (err, results) => {
      if (err) {
        return res.status(500).json({ message: "Database error", error: err });
      }

      // Count the total number of matching records for pagination
      const countSql = `SELECT COUNT(*) AS totalCount FROM donations 
        WHERE donor_name LIKE ? 
        OR donation_type LIKE ? 
        OR notes LIKE ?`;

      db.query(
        countSql,
        [searchQuery, searchQuery, searchQuery],
        (err, countResult) => {
          if (err) {
            return res
              .status(500)
              .json({ message: "Database error", error: err });
          }

          // Send back both the donations data and the total count
          res.status(200).json({
            donations: results,
            totalCount: countResult[0].totalCount,
          });
        }
      );
    }
  );
}

// Read a single donation by ID (GET)
export function getDonationById(req, res) {
  const { id } = req.params;
  const query = `SELECT * FROM donations WHERE donation_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error fetching donation", error: error.message });
    }
    if (results.length === 0) {
      return res.status(404).json({ message: "Donation not found" });
    }
    return res.status(200).json(results[0]);
  });
}

// Update a donation by ID (PUT)
export function updateDonation(req, res) {
  const donationData = req.body;
  const { id } = req.params;
  const query = `UPDATE donations SET ? WHERE donation_id = ?`;

  db.query(query, [donationData, id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error updating donation", error: error.message });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Donation not found" });
    }
    return res.status(200).json({ message: "Donation updated successfully" });
  });
}

// Delete a donation by ID (DELETE)
export function deleteDonation(req, res) {
  const { id } = req.params;
  const query = `DELETE FROM donations WHERE donation_id = ?`;

  db.query(query, [id], (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error deleting donation", error: error.message });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ message: "Donation not found" });
    }
    return res.status(200).json({ message: "Donation deleted successfully" });
  });
}
