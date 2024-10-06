// routes/sheltersRoutes.js

import { Router } from "express";
import { createShelter, getShelters, getShelterById, updateShelter, deleteShelter } from "../controllers/sheltersController.js"; // Adjust the path as necessary

const router = Router();

router.post("/", createShelter); // Create a shelter
router.get("/", getShelters); // Get all shelters
router.get("/:id", getShelterById); // Get a shelter by ID
router.patch("/:id", updateShelter); // Update a shelter
router.delete("/:id", deleteShelter); // Delete a shelter

export default router;
