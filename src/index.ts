import express from "express";
import bodyParser from "body-parser";
import cors from "cors";
import helmet from "helmet";
import morgan from "morgan";
import userRoutes from "./routes/user-routes";
import { errorHandlerMiddleware } from "./middlewares/error-handler";
import authRoutes from "./routes/auth-routes";
import { envConfig } from "./config/env";
import passwordRoutes from "./routes/password-routes";

/* CONFIGURATIONS */
const app = express();
app.use(express.json());
app.use(helmet());
app.use(helmet.crossOriginResourcePolicy({ policy: "cross-origin" }));
app.use(morgan("common"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cors());

/* ROUTES */
app.use("/users", userRoutes); // http://localhost:8000/users
app.use("/auth", authRoutes); // http://localhost:8000/auth
app.use("/password", passwordRoutes); // http://localhost:8000/password

/* ERROR HANDLER */
app.use(errorHandlerMiddleware);

/* SERVER */
const port = envConfig.PORT || 3001;
app.listen(port, "0.0.0.0", () => {
  console.log(`Server running on port ${port}`);
});
