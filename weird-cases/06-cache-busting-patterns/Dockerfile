# syntax=docker/dockerfile:1.7
FROM node:22-slim
WORKDIR /app

# Good: copy only package files so install is cached
COPY package*.json ./
RUN --mount=type=cache,target=/root/.npm npm ci

# Bad: copying whole context before install - busts cache on any change
# COPY . .
# RUN npm ci

# Demonstration file copy after install (good practice)
COPY . .

CMD ["node","index.js"]
