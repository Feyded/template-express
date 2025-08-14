import { config } from "dotenv";
import { z } from "zod";

config();

const envSchema = z.object({
  FRONTEND_URL: z.string().default("http://localhost:3000"),
  PORT: z.coerce.number(),
  DATABASE_URL: z.string(),
  JWT_ACCESS_SECRET: z.string(),
  EMAIL_USER: z.string(),
  EMAIL_PASS: z.string(),
  AWS_ACCESS_KEY_ID: z.string(),
  AWS_SECRET_ACCESS_KEY: z.string(),
  AWS_REGION: z.string(),
  AWS_S3_BUCKET_NAME: z.string(),
});

export const envConfig = envSchema.parse({
  FRONTEND_URL: process.env.FRONTEND_URL,
  PORT: process.env.PORT,
  DATABASE_URL: process.env.DATABASE_URL,
  JWT_ACCESS_SECRET: process.env.JWT_ACCESS_SECRET,
  EMAIL_USER: process.env.EMAIL_USER,
  EMAIL_PASS: process.env.EMAIL_PASS,
  AWS_ACCESS_KEY_ID: process.env.AWS_ACCESS_KEY_ID,
  AWS_SECRET_ACCESS_KEY: process.env.AWS_SECRET_ACCESS_KEY,
  AWS_REGION: process.env.AWS_REGION,
  AWS_S3_BUCKET_NAME: process.env.AWS_S3_BUCKET_NAME,
});

export type EnvConfig = z.infer<typeof envSchema>;
