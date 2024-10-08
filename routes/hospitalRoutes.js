import { Router } from "express";
import {
  createHospital,
  getAllHospitals,
  getHospitalById,
  updateHospital,
  deleteHospital,
} from "../controllers/hospitalController.js";

const router = Router();

router.post("/", createHospital); // Create a new hospital
router.get("/", getAllHospitals); // Get all hospitals
router.get("/:id", getHospitalById); // Get a hospital by ID
router.patch("/:id", updateHospital); // Update a hospital by ID
router.delete("/:id", deleteHospital); // Delete a hospital by ID

export default router;
