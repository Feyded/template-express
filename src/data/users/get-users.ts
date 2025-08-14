import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const getUsersData = async () => {
  return await prisma.users.findMany();
};
