FROM node:16-alpine AS base

FROM base AS builder

WORKDIR /builder

# Copy package files
COPY package*.json ./
COPY prisma ./prisma

# Install dependencies
RUN npm install

# Copy source code
COPY . .

# Generate Prisma client
RUN npx prisma generate

# Build the application
RUN npm run build

FROM base AS runner

WORKDIR /runner

# Copy necessary files from builder
COPY --from=builder /builder/node_modules /runner/node_modules
COPY --from=builder /builder/dist /runner/dist
COPY --from=builder /builder/package.json /runner/package.json
COPY --from=builder /builder/prisma /runner/prisma

EXPOSE 80

# Use a proper entrypoint script or separate the commands
CMD ["sh", "-c", "npm run migrate:deploy && node /runner/dist/src/index.js"]