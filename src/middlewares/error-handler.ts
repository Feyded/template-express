import { Request, Response, NextFunction, ErrorRequestHandler } from 'express';
import { makeError } from '../utils/error';

export const errorHandlerMiddleware: ErrorRequestHandler = (
  err: Error, 
  req: Request, 
  res: Response, 
  next: NextFunction
) => {
  const { error, statusCode } = makeError(err);
  res.status(statusCode).json(error);
};