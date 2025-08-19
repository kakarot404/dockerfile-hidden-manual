# syntax=docker/dockerfile:1.7
FROM node:22-slim AS builder
WORKDIR /app
COPY package*.json ./
RUN --mount=type=cache,target=/root/.npm npm ci
COPY . .
# simulate build output
RUN mkdir -p dist && echo "console.log('dist app')" > dist/index.js

FROM node:22-slim AS runtime
WORKDIR /app
COPY --from=builder /app/package*.json ./
RUN --mount=type=cache,target=/root/.npm npm ci --omit=dev --ignore-scripts
COPY --from=builder /app/dist ./dist
CMD ["node","dist/index.js"]
