import { PrismaClient } from "@prisma/client";
import { users } from "./data/users";


const prisma = new PrismaClient();

async function main() {
  console.log("Starting user seeding...");

  for (const user of users) {
    try {
      const createdUser = await prisma.users.create({
        data: user,
      });
      console.log(
        `Created user: ${createdUser.firstname} ${createdUser.middlename} ${createdUser.lastname}`
      );
    } catch (error) {
      console.error(
        `Error creating user ${user.firstname} ${user.lastname}:`,
        error
      );
    }
  }

  console.log("Users seeding completed!");

}

main()
  .catch((e) => {
    console.error("Error during seeding:", e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
