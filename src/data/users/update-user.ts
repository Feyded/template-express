import { PrismaClient } from "@prisma/client";
import { ConflictError, NotFoundError } from "../../utils/error";
import { updateUserSchema } from "./schema";
import { deleteImageFromS3 } from "../../lib/multer";

const prisma = new PrismaClient();

type UpdateUserDataParams = {
  id: string;
  payload: any;
  file?: Express.MulterS3.File
};

export const updateUserData = async ({ id, payload, file }: UpdateUserDataParams) => {
  const validatedUser = updateUserSchema.parse(payload);

  const user = await prisma.users.findUnique({ where: { id } });
  if (!user) throw new NotFoundError("User not found");

  const emailDuplicateCheck = await prisma.users.findFirst({
    where: {
      email: validatedUser.email,
      NOT: { id },
    },
  });

  if (emailDuplicateCheck) throw new ConflictError("Email already exists");

  // let avatar = user.avatar;
  // if (file) {
  //   if (user.avatar) {
  //     await deleteImageFromS3(user.avatar);
  //   }
  //   avatar = file.location;
  // }

  const updatedUser = await prisma.users.update({
    where: { id },
    data: { ...validatedUser },
  });

  const { password, ...withoutPassword } = updatedUser;

  return withoutPassword;
};
