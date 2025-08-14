import { Request, Response } from "express";
import { updatePasswordData } from "../data/password/update-password";
import { verifyPasswordResetToken } from "../utils/password-reset-utils";

export const changePasswordController = async (req: Request, res: Response) => {
  const { userId, password } = await req.body;
  const result = await updatePasswordData(userId, password);
  res.json(result);
};

export const verifyPasswordResetTokenController = async (
  req: Request,
  res: Response
) => {
  const { userId, token } = await req.body;
  const isVerified = await verifyPasswordResetToken(userId, token);
  res.json(isVerified);
};
