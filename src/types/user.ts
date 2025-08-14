import { users } from "@prisma/client";

export type User = users;

export type UserWithoutPassword = Omit<users, 'password'>;
