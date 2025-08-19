# syntax=docker/dockerfile:1.7

############################
# Stage 1: Builder
############################
FROM node:18 AS builder
WORKDIR /app
COPY package*.json ./
RUN --mount=type=cache,target=/root/.npm npm ci

# Copy rest of the source code
COPY . .

############################
# Stage 2: Runtime (slim)
############################
FROM node:22-alpine AS runtime
WORKDIR /app

# Copy only prod deps (musl-compatible) — reinstall on alpine to avoid ABI mismatches
COPY --from=builder /app/package*.json ./
RUN --mount=type=cache,target=/root/.npm npm ci --omit=dev --ignore-scripts

# COPY --from=builder /app/dist ./dist
COPY --from=builder /app/index.js ./index.js

RUN addgroup --system app && adduser --system --ingroup app --uid 10001 kakarot404
USER kakarot404
EXPOSE 3000
CMD ["node", "index.js"]