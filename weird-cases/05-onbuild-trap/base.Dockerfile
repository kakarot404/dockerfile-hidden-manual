# syntax=docker/dockerfile:1.7
FROM node:22-slim
# These commands will run when someone builds FROM this image
ONBUILD COPY package*.json /app/
ONBUILD RUN ls -la /app || true
