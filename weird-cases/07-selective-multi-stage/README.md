# Selective Multi-stage

Why: Show copying only runtime artifacts (dist, compiled binary) instead of entire workspace.

- Build only the final artifact into runtime stage.
- Avoid copying dev files, caches, or build tools to final image.

**Run**
DOCKER_BUILDKIT=1 docker build -t wc-selective .
docker run --rm wc-selective

__Interview callout :__  
- Explain benefit for smaller images, reduced attack surface and faster deploys.
