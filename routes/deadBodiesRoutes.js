import { Router } from "express";
import {
  createDeadBody,
  getAllDeadBodies,
  getDeadBodyById,
  updateDeadBody,
  deleteDeadBody,
} from "../controllers/deadBodiesController.js"; // Adjust the path as necessary

const router = Router();

router.post("/", createDeadBody); // Create a new dead body record
router.get("/", getAllDeadBodies); // Get all dead body records
router.get("/:id", getDeadBodyById); // Get a single dead body record by ID
router.patch("/:id", updateDeadBody); // Update a dead body record by ID
router.delete("/:id", deleteDeadBody); // Delete a dead body record by ID

export default router;
