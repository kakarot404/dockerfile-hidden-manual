# syntax=docker/dockerfile:1.7

############################
# Stage 1: Builder
############################
FROM node:18 AS builder
WORKDIR /app

# Only copy lockfiles first for cache-friendly installs
COPY package*.json ./
RUN --mount=type=cache,target=/root/.npm \
    npm ci

# Copy remaining source files
COPY . .

# Build the app (only needed for apps with build step, like React, TypeScript, etc.)
# If it's a simple app, this can be skipped
RUN npm run build

############################
# Stage 2: Runtime (slim)
############################
FROM node:22-slim AS runtime
WORKDIR /app

# Copy only necessary files from the builder stage
COPY --from=builder /app/package*.json ./
RUN --mount=type=cache,target=/root/.npm \
    npm ci --omit=dev --ignore-scripts

    
# Copy dist or minimal runtime files
# COPY --from=builder /app/dist ./dist
# If no build step, copy source (but consider ts → dist as a best practice)
COPY --from=builder /app/index.js ./index.js

ENV NODE_ENV=production
EXPOSE 3000

# Set non-root user (optional, better for prod)
RUN addgroup --system app && adduser --system --ingroup app --uid 10001 kakarot404
USER kakarot404
CMD ["node", "index.js"]