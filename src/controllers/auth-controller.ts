import { Request, Response } from "express";
import { getUsersData } from "../data/users/get-users";
import { NotFoundError, UnauthorizedError } from "../utils/error";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import { envConfig } from "../config/env";
import { PrismaClient } from "@prisma/client";
import { DecodedToken } from "../middlewares/auth-middleware";
import { getUserData } from "../data/users/get-user";
import { User } from "../types/user";

const prisma = new PrismaClient();

export const loginController = async (req: Request, res: Response) => {
  const body = await req.body;
  const users: User[] = await getUsersData();
  const user = users.find((user) => user.email === body.email);
  if (!user) throw new NotFoundError("Invalid credentials");
  const isPasswordValid = await bcrypt.compare(body.password, user.password);
  if (!isPasswordValid) throw new UnauthorizedError("Invalid credentials");
  const token = jwt.sign(
    {
      id: user.id,
      email: user.email,
      iss: "login",
      aud: "server",
    },
    envConfig.JWT_ACCESS_SECRET,
    { expiresIn: "7d" }
  );
  const { password, ...userWithoutPassword } = user;
  res.status(200).json({ token, user: userWithoutPassword });
};

export const verifyTokenController = async (req: Request, res: Response) => {
  const token = req.headers.authorization?.split(" ")[1];
  if (!token) throw new UnauthorizedError("No token provided");
  const decoded_jwt = jwt.verify(
    token,
    envConfig.JWT_ACCESS_SECRET
  ) as DecodedToken;
  const user = await getUserData(decoded_jwt.id);
  const { password, ...userWithoutpassword } = user;
  res.status(200).json({ decoded_jwt, user: userWithoutpassword });
};
