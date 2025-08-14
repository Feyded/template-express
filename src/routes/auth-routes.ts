import { Router } from "express";
import { loginController, verifyTokenController } from "../controllers/auth-controller";

const router = Router();

router.post("/", loginController);
router.get("/verify-token", verifyTokenController);

export default router;
