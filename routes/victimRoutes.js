const express = require('express');
const router = express.Router();
const victimController = require('../controllers/victimController');

// Define routes for the victim resource
router.post('/', victimController.createVictim);            // Create victim
router.get('/', victimController.getAllVictims);           // Get all victims
router.get('/:id', victimController.getVictimById);        // Get a single victim by ID
router.put('/:id', victimController.updateVictim);          // Update victim by ID
router.delete('/:id', victimController.deleteVictim);       // Delete victim by ID

module.exports = router;
