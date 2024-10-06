import { Router } from "express";
const router = Router();
import {
  createVictim,
  getAllVictims,
  getVictimById,
  updateVictim,
  deleteVictim,
} from "../controllers/victimController.js";

// Define routes for the victim resource
router.post("/", createVictim); // Create victim
router.get("/", getAllVictims); // Get all victims
router.get("/:id", getVictimById); // Get a single victim by ID
router.patch("/:id", updateVictim); // Update victim by ID
router.delete("/:id", deleteVictim); // Delete victim by ID

export default router;
