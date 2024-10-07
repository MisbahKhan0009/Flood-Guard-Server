import express, { application } from "express";
import bodyParser from "body-parser";
import victimRoutes from "./routes/victimRoutes.js";
import donationsRoutes from "./routes/donationsRoutes.js";
import sheltersRoutes from "./routes/sheltersRoutes.js";
import rescuerRoutes from "./routes/rescuerRoutes.js";
import rescueAssignmentsRoutes from "./routes/rescueAssignmentsRoutes.js";

// Initialize express
const app = express();
const PORT = 3000;

// Destructure and use json() middleware
const { json } = bodyParser;
app.use(json());

// Routes
app.use("/api/victims", victimRoutes);
app.use("/api/donations", donationsRoutes);
app.use("/api/shelters", sheltersRoutes);
app.use("/api/rescuers", rescuerRoutes);
app.use("/api/rescue-assignments", rescueAssignmentsRoutes);

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});


//http://localhost:3000/api/  == base route