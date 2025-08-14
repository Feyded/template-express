import { Request, Response } from "express";
import { getUsersData } from "../data/users/get-users";
import { getUserData } from "../data/users/get-user";
import { createUserData } from "../data/users/create-user";
import { updateUserData } from "../data/users/update-user";
import { sendEmail } from "../services/email";
import {
  generatePasswordResetToken,
  generateResetPasswordUrl,
} from "../utils/password-reset-utils";
import { User } from "../types/user";

export const getUsersController = async (req: Request, res: Response) => {
  const users = await getUsersData();
  const usersWithoutPassword = users.map((user: User) => {
    const { password, ...userWithoutPassword } = user;
    return userWithoutPassword;
  });
  res.json(usersWithoutPassword);
};

export const getUserController = async (req: Request, res: Response) => {
  const userId = req.params.id;
  const user = await getUserData(userId);
  const { password, ...userWithoutPassword } = user;
  res.status(200).json(userWithoutPassword);
};

export const createUserController = async (req: Request, res: Response) => {
  const file = req.file as Express.MulterS3.File;
  const user = req.user;
  const body = await req.body;
  const newUser = await createUserData({ ...body, created_by: user?.id }, file);
  const { password, ...userWithoutPassword } = newUser;
  // const resetToken = await generatePasswordResetToken(newUser.id);
  // const resetPasswordUrl = generateResetPasswordUrl(newUser.id, resetToken);
  res.status(201).json(userWithoutPassword);
};

export const updateUserController = async (req: Request, res: Response) => {
  const userId = req.params.id;
  const file = req.file as Express.MulterS3.File;
  const authenticatedUser = req.user;
  const body = await req.body;
  const updatedUser = await updateUserData({
    id: userId,
    payload: { ...body, updated_by: authenticatedUser?.id },
    file,
  });
  res.status(200).json(updatedUser);
};
