import { Router } from "express";
import {
  createUserController,
  getUserController,
  getUsersController,
  updateUserController,
} from "../controllers/user-controller";
import { authMiddleware } from "../middlewares/auth-middleware";
import { upload } from "../lib/multer";

const router = Router();

// router.use(authMiddleware(["super_admin", "admin"]));

router.get("/", getUsersController);
router.post("/", upload.single("avatar"), createUserController);
router.get("/:id", getUserController);
router.patch("/:id", upload.single("avatar"), updateUserController);

export default router;
