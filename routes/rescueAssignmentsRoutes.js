import { Router } from "express";
import {
  createRescueAssignment,
  getAllRescueAssignments,
  getRescueAssignmentById,
  updateRescueAssignment,
  deleteRescueAssignment,
} from "../controllers/rescueAssignmentsController.js";

const router = Router();

router.post("/", createRescueAssignment); // Create a rescue assignment
router.get("/", getAllRescueAssignments); // Get all rescue assignments
router.get("/:id", getRescueAssignmentById); // Get a rescue assignment by ID
router.patch("/:id", updateRescueAssignment); // Update a rescue assignment
router.delete("/:id", deleteRescueAssignment); // Delete a rescue assignment

export default router;
