import { Request, Response, NextFunction } from "express";
import jwt, { JwtPayload } from "jsonwebtoken";
import { ForbiddenError, UnauthorizedError } from "../utils/error";
import { envConfig } from "../config/env";

export interface DecodedToken extends JwtPayload {
  id: string;
  email: string;
  role: string;
  iss: string;
  aud: string;
}

declare global {
  namespace Express {
    interface Request {
      user?: DecodedToken;
    }
  }
}

export const authMiddleware = (allowedRoles: string[]) => {
  return (req: Request, res: Response, next: NextFunction): void => {
    const token = req.headers.authorization?.split(" ")[1];

    if (!token) {
      throw new UnauthorizedError("No token provided");
    }

    const decoded = jwt.verify(
      token,
      envConfig.JWT_ACCESS_SECRET
    ) as DecodedToken;

    if (!allowedRoles.includes(decoded.role))
      throw new ForbiddenError("Forbidden");

    req.user = decoded;
    next();
  };
};
