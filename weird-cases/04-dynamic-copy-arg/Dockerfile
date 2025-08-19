# syntax=docker/dockerfile:1.7
ARG TARGET=dev
FROM node:22-slim AS base
WORKDIR /app
COPY package*.json ./
RUN --mount=type=cache,target=/root/.npm npm ci

# Use ARG to select which config to COPY
FROM base AS final
ARG TARGET
COPY config.${TARGET}.json /app/config.json
COPY . .
CMD ["node","-e","console.log(require('./config.json'))"]
