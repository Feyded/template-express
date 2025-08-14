import multer from "multer";
import multerS3 from "multer-s3";
import path from "path";
import crypto from "crypto";
import { S3Client, DeleteObjectCommand } from "@aws-sdk/client-s3";
import { envConfig } from "../config/env";

const s3Client = new S3Client({
  region: envConfig.AWS_REGION,
  credentials: {
    accessKeyId: envConfig.AWS_ACCESS_KEY_ID,
    secretAccessKey: envConfig.AWS_SECRET_ACCESS_KEY,
  },
});

const bucketName = envConfig.AWS_S3_BUCKET_NAME;

const upload = multer({
  storage: multerS3({
    s3: s3Client,
    bucket: bucketName,
    metadata: (req, file, cb) => {
      cb(null, { fieldName: file.fieldname });
    },
    key: (req, file, cb) => {
      const fileExtension = path.extname(file.originalname);
      const uniqueFilename = `${Date.now()}-${crypto
        .randomUUID()
        .replace(/-/g, "")}${fileExtension}`;
      cb(null, uniqueFilename);
    },
  }),
});

const deleteImageFromS3 = async (url: string) => {
  const urlObj = new URL(url);
  const key = urlObj.pathname.substring(1);
  const params = {
    Bucket: bucketName,
    Key: key,
  };
  const command = new DeleteObjectCommand(params);
  const response = await s3Client.send(command);
  return response;
};

export { upload, deleteImageFromS3 };
