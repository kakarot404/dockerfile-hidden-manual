# syntax=docker/dockerfile:1.7
FROM node:22-slim

# Create a dedicated user with fixed UID/GID (K8s-friendly)
RUN groupadd -g 10001 app && \
    useradd -r -g app -u 10001 app

WORKDIR /app

# Copy manifests and install prod deps with cache
COPY package*.json ./
RUN --mount=type=cache,target=/root/.npm npm ci --omit=dev --ignore-scripts

# Copy the minimal runtime files (e.g., dist only)
# COPY dist/ ./dist
COPY . .

# OCI labels (great for inventories/SBOMs)
LABEL org.opencontainers.image.title="dockerfile-hidden-manual" \
      org.opencontainers.image.description="Production-ready Node example with non-root, labels, healthcheck" \
      org.opencontainers.image.licenses="MIT"

ENV NODE_ENV=production
USER 10001:10001

# Optional: Healthcheck (keep it lightweight)
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD node -e "require('http').get('http://127.0.0.1:3000', r => process.exit(r.statusCode===200?0:1)).on('error',()=>process.exit(1))"

EXPOSE 3000
CMD ["node", "index.js"]
