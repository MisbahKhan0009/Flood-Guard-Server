import { Router } from "express";
import {
  createHydroLevelMap,
  getAllHydroLevelMaps,
  getHydroLevelMapById,
  updateHydroLevelMap,
  deleteHydroLevelMap,
} from "../controllers/hydroLevelMapController.js";

const router = Router();

router.post("/", createHydroLevelMap); // Create a new hydro level map
router.get("/", getAllHydroLevelMaps); // Get all hydro level maps
router.get("/:id", getHydroLevelMapById); // Get a hydro level map by ID
router.patch("/:id", updateHydroLevelMap); // Update a hydro level map by ID (PATCH)
router.delete("/:id", deleteHydroLevelMap); // Delete a hydro level map by ID

export default router;
