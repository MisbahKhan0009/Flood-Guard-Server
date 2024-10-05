const db = require("../config/db");

// Create victim (POST)
exports.createVictim = (req, res) => {
  let victim = req.body;
  let sql = "INSERT INTO victim SET ?";
  db.query(sql, victim, (err, result) => {
    if (err) throw err;
    res.send("Victim profile created.");
  });
};

// Get all victims (GET)
exports.getAllVictims = (req, res) => {
  let sql = "SELECT * FROM victim";
  db.query(sql, (err, results) => {
    if (err) throw err;
    res.json(results);
  });
};

// Get a single victim by ID (GET)
exports.getVictimById = (req, res) => {
  let sql = "SELECT * FROM victim WHERE NID = ?";
  db.query(sql, [req.params.id], (err, result) => {
    if (err) throw err;
    res.json(result);
  });
};

// Update victim by ID (PUT)
exports.updateVictim = (req, res) => {
  let sql = "UPDATE victim SET ? WHERE NID = ?";
  db.query(sql, [req.body, req.params.id], (err, result) => {
    if (err) throw err;
    res.send("Victim profile updated.");
  });
};

// Delete victim by ID (DELETE)
exports.deleteVictim = (req, res) => {
  let sql = "DELETE FROM victim WHERE NID = ?";
  db.query(sql, [req.params.id], (err, result) => {
    if (err) throw err;
    res.send("Victim profile deleted.");
  });
};
