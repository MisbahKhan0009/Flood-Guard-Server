const express = require("express");
const bodyParser = require("body-parser");
const victimRoutes = require("./routes/victimRoutes");

const app = express();
const PORT = 3000;

// Middleware
app.use(bodyParser.json());

// Use routes
app.use("/api/victims", victimRoutes);

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
