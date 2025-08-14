import { Router } from "express";
import {
  changePasswordController,
  verifyPasswordResetTokenController,
} from "../controllers/password-controller";

const router = Router();

router.post("/reset-password", changePasswordController);
router.post("/verify-password-reset-token", verifyPasswordResetTokenController);

export default router;
