import { PrismaClient } from "@prisma/client";
import { NotFoundError } from "../../utils/error";

const prisma = new PrismaClient();

export const getUserData = async (id: string) => {
  const user = await prisma.users.findUnique({
    where: {
      id: id,
    },
  });
  if (!user) throw new NotFoundError("User not found");
  return user;
};
