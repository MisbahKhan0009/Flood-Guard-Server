import express, { application } from "express";
import bodyParser from "body-parser";
import cors from "cors"; // Import cors package
import victimRoutes from "./routes/victimRoutes.js";
import donationsRoutes from "./routes/donationsRoutes.js";
import sheltersRoutes from "./routes/sheltersRoutes.js";
import rescuerRoutes from "./routes/rescuerRoutes.js";
import rescueAssignmentsRoutes from "./routes/rescueAssignmentsRoutes.js";
import emergencyAlertsRoutes from "./routes/emergencyAlertsRoutes.js";
import floodsRoutes from "./routes/floodsRoutes.js";
import deadBodiesRoutes from "./routes/deadBodiesRoutes.js";
import hospitalRoutes from "./routes/hospitalRoutes.js";
import hydroLevelMapRoutes from "./routes/hydroLevelMapRoutes.js";
import waterLevelRoutes from "./routes/waterLevelRoutes.js";

// Initialize express
const app = express();
const PORT = 3000;

// Destructure and use json() middleware
const { json } = bodyParser;
app.use(json());

// Use CORS middleware
const allowedOrigins = ["http://localhost:5173"]; // Specify your frontend URL

app.use(
  cors({
    origin: allowedOrigins,
    methods: ["GET", "POST", "PUT", "DELETE"], // Specify allowed HTTP methods
    credentials: true, // Allow credentials to be sent
  })
);

// Routes
app.use("/api/victims", victimRoutes);
app.use("/api/donations", donationsRoutes);
app.use("/api/shelters", sheltersRoutes);
app.use("/api/rescuers", rescuerRoutes);
app.use("/api/rescue-assignments", rescueAssignmentsRoutes);
app.use("/api/emergency-alerts", emergencyAlertsRoutes);
app.use("/api/floods", floodsRoutes);
app.use("/api/dead-bodies", deadBodiesRoutes);
app.use("/api/hospitals", hospitalRoutes);
app.use("/api/hydro-level-maps", hydroLevelMapRoutes);
app.use("/api/water-levels", waterLevelRoutes);

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});

// http://localhost:3000/api/  == base route
