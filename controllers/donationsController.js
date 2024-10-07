import db from "../config/db.js";

// Create a new donation (POST)
export function createDonation(req, res) {
  const donationData = req.body; // Take all data from req.body
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

// Read all donations (GET)
export function getAllDonations(req, res) {
  const query = `SELECT * FROM donations`;

  db.query(query, (error, results) => {
    if (error) {
      return res
        .status(500)
        .json({ message: "Error fetching donations", error: error.message });
    }
    return res.status(200).json(results);
  });
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
  const donationData = req.body; // Take all data from req.body
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
