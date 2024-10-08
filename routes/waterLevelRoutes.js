import { Router } from "express";
import {
  createWaterLevel,
  getAllWaterLevels,
  getWaterLevelById,
  updateWaterLevel,
  deleteWaterLevel,
} from "../controllers/waterLevelController.js";

const router = Router();

router.post("/", createWaterLevel); // Create a new water level
router.get("/", getAllWaterLevels); // Get all water levels
router.get("/:id", getWaterLevelById); // Get a water level by ID
router.patch("/:id", updateWaterLevel); // Update a water level by ID (PATCH)
router.delete("/:id", deleteWaterLevel); // Delete a water level by ID

export default router;
