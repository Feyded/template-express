import nodemailer from "nodemailer";
import { envConfig } from "../config/env";

const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: envConfig.EMAIL_USER,
    pass: envConfig.EMAIL_PASS,
  },
});

export const getPasswordResetTemplate = (resetUrl: string) => {
  const baseUrl = envConfig.FRONTEND_URL || "http://localhost:3000";
  // const logoUrl = `${baseUrl}/assets/logo.png`;
  const logoUrl = `https://nsj-tech.s3.us-east-1.amazonaws.com/logo.png`;

  return `
    <!DOCTYPE html>
    <html>
      <head>
        <style>
          body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
          }
          .container {
            background-color: #f9f9f9;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
          }
          .header {
            text-align: center;
            margin-bottom: 30px;
          }
          .logo {
            max-width: 200px;
            height: auto;
            margin-bottom: 20px;
          }
          .button {
            display: inline-block;
            background-color: #007bff;
            color: white;
            padding: 12px 24px;
            text-decoration: none;
            border-radius: 4px;
            margin: 20px 0;
          }
          .footer {
            margin-top: 30px;
            font-size: 12px;
            color: #666;
            text-align: center;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <div class="header">
            <img src="${logoUrl}" alt="Company Logo" class="logo">
            <h2>Password Reset Request</h2>
          </div>
          <p>Hello,</p>
          <p>We received a request to reset your password. Click the button below to set a new password:</p>
          <div style="text-align: center;">
            <a href="${resetUrl}" class="button">Reset Password</a>
          </div>
          <p>If you didn't request this password reset, you can safely ignore this email.</p>
          <p>This link will expire in 1 hour for security reasons.</p>
          <div class="footer">
            <p>If you're having trouble clicking the button, copy and paste this URL into your browser:</p>
            <p>${resetUrl}</p>
          </div>
        </div>
      </body>
    </html>
  `;
};

export const sendEmail = async (
  to: string,
  subject: string,
  resetUrl: string
) => {
  const mailOptions = {
    from: envConfig.EMAIL_USER,
    to,
    subject,
    html: getPasswordResetTemplate(resetUrl),
    text: `Reset your password by clicking this link: ${resetUrl}`,
  };
  await transporter.sendMail(mailOptions);
};
