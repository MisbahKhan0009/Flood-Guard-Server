import { Router } from "express";
import {
  createRescuer,
  getAllRescuers,
  getRescuerByEmail,
  updateRescuer,
  deleteRescuer,
} from "../controllers/rescuerController.js";

const router = Router();

router.post("/", createRescuer); // Create a rescuer
router.get("/", getAllRescuers); // Get all rescuers
router.get("/:email", getRescuerByEmail); // Get a rescuer by ID
router.patch("/:id", updateRescuer); // Update a rescuer
router.delete("/:id", deleteRescuer); // Delete a rescuer

export default router;
