import { Router } from "express";
import {
  createEmergencyAlert,
  getAllEmergencyAlerts,
  getEmergencyAlertById,
  updateEmergencyAlert,
  deleteEmergencyAlert,
} from "../controllers/emergencyAlertsController.js";

const router = Router();

router.post("/", createEmergencyAlert); // Create a new emergency alert
router.get("/", getAllEmergencyAlerts); // Get all emergency alerts
router.get("/:id", getEmergencyAlertById); // Get a single emergency alert by ID
router.patch("/:id", updateEmergencyAlert); // Update an emergency alert by ID
router.delete("/:id", deleteEmergencyAlert); // Delete an emergency alert by ID

export default router;
