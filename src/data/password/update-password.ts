import { PrismaClient } from "@prisma/client";
import bcrypt from "bcrypt";
import { NotFoundError } from "../../utils/error";

const prisma = new PrismaClient();

export const updatePasswordData = async (
  userId: string,
  newPassword: string
) => {
  const hashedPassword = await bcrypt.hash(newPassword, 10);
  const user = await prisma.users.findUnique({
    where: { id: userId },
  });
  if (!user) throw new NotFoundError("User not found");
  const updatedUser = await prisma.users.update({
    where: { id: userId },
    data: { password: hashedPassword },
  });
  await prisma.password_reset_tokens.deleteMany({
    where: { user_id: updatedUser.id },
  });


  const { password, ...userWithoutPassword } = updatedUser;
  return userWithoutPassword;
};
