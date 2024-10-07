import { Router } from "express";
const router = Router();
import { createDonation, getAllDonations, getDonationById, updateDonation, deleteDonation } from "../controllers/donationsController.js";

// Define routes
router.post("/", createDonation);
router.get("/", getAllDonations);
router.get("/:id", getDonationById);
router.patch("/:id", updateDonation);
router.delete("/:id", deleteDonation);

export default router;


