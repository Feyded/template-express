import crypto from "crypto";
import { envConfig } from "../config/env";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const generatePasswordResetToken = async (userId: string) => {
  const resetToken = crypto.randomBytes(32).toString("hex");
  const hashedToken = crypto
    .createHash("sha256")
    .update(resetToken)
    .digest("hex");
  const expires_at = new Date(Date.now() + 24 * 60 * 60 * 1000);
  await prisma.password_reset_tokens.create({
    data: {
      user_id: userId,
      token: hashedToken,
      expires_at,
    },
  });
  return resetToken;
};

export const verifyPasswordResetToken = async (
  userId: string,
  token: string
): Promise<boolean> => {
  const hashedToken = crypto.createHash("sha256").update(token).digest("hex");
  const resetToken = await prisma.password_reset_tokens.findFirst({
    where: {
      user_id: userId,
      token: hashedToken,
      expires_at: {
        gt: new Date(),
      },
    },
  });

  return !!resetToken;
};

export const generateResetPasswordUrl = (
  userId: string,
  token: string
): string => {
  return `${envConfig.FRONTEND_URL}/reset-password?userId=${userId}&token=${token}`;
};
