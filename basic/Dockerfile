# syntax=docker/dockerfile:1.7

FROM node:22-slim
# Use an official Node.js runtime as a parent image

WORKDIR /app
# set working directory

COPY package*.json ./
# copy only manifests first to leverage cache

RUN --mount=type=cache,target=/root/.npm \
    npm ci --ignore-scripts
# Install dependencies

COPY . .
# copy rest of application

ENV NODE_ENV=production
# Set a sane default environment

RUN addgroup --system app && adduser --system --ingroup app --uid 10001 kakarot404
USER kakarot404

EXPOSE 3000
# Expose app port

CMD ["node", "index.js"]
# Run app
