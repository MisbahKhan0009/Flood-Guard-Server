import { Router } from "express";
import multer, { memoryStorage } from "multer";
import { uploader } from "../config/cloudinary";
const router = Router();

// Configure Multer storage
const storage = memoryStorage(); // Store image in memory temporarily
const upload = multer({ storage });

// API route to handle image upload
router.post("/upload", upload.single("image"), async (req, res) => {
  try {
    const file = req.file;

    // Upload to Cloudinary
    const result = await uploader.upload_stream(
      {
        resource_type: "image",
      },
      (error, result) => {
        if (error) {
          return res.status(500).json({ error: "Image upload failed" });
        }
        res
          .status(200)
          .json({ message: "Image uploaded", url: result.secure_url });
      }
    );

    file.stream.pipe(result);
  } catch (err) {
    res.status(500).json({ error: "Error uploading image" });
  }
});

export default router;
