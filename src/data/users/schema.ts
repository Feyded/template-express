import { z } from "zod";

const userSchemaObject = {
  avatar: z.coerce.string().optional(),
  firstname: z.string().min(2).max(50),
  middlename: z.string().nullable().optional(),
  lastname: z.string().min(2).max(50),
  email: z.string().email().max(50),
  password: z.string().min(2).max(50),
};

export const userSchema = z.object(userSchemaObject);
export type CreateUserType = z.infer<typeof userSchema>;

export const updateUserSchema = userSchema.omit({ password: true });
export type UpdateUserType = z.infer<typeof updateUserSchema>;
