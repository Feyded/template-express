import { PrismaClient } from "@prisma/client";
import { userSchema, CreateUserType } from "./schema";
import bcrypt from "bcrypt";
import { getUsersData } from "./get-users";
import { ConflictError } from "../../utils/error";
import { User } from "../../types/user";

const prisma = new PrismaClient();

export const createUserData = async (body: CreateUserType, file: Express.MulterS3.File) => {
  const validatedUser = userSchema.parse(body);
  const users: User[] = await getUsersData();
  const emailExists = users.some((user: User) => user.email.toLowerCase() === validatedUser.email.toLowerCase());
  if (emailExists) throw new ConflictError("Email already exists");

  const hashedPassword = await bcrypt.hash(validatedUser.password, 10);
  validatedUser.password = hashedPassword;
  
  const user = await prisma.users.create({ data: { ...validatedUser } });
  
  return user;
};
