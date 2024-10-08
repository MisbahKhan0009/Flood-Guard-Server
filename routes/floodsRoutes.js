import { Router } from "express";
import {
  createFlood,
  getAllFloods,
  getFloodById,
  updateFlood,
  deleteFlood,
} from "../controllers/floodsController.js"; 

const router = Router();

router.post("/", createFlood); // Create a new flood record
router.get("/", getAllFloods); // Get all flood records
router.get("/:id", getFloodById); // Get a single flood record by ID
router.patch("/:id", updateFlood); // Update a flood record by ID
router.delete("/:id", deleteFlood); // Delete a flood record by ID

export default router;
