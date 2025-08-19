# Cache Busting Patterns

Why: Teach patterns to preserve cache for expensive steps and how small changes can bust cache.

- Always COPY manifest files first to maximize cache hits for dependency install.
- Avoid COPY . . before install.
- For npm, `--mount=type=cache` speeds repeated builds.

**Try**
1. Build: `DOCKER_BUILDKIT=1 docker build -t wc-cache-first .` (fast on repeated builds)
2. Edit index.js and re-build — observe install step is cached.

__Interview callout :__  
- Describe devil-in-detail: how `.dockerignore` interacts with cache and context upload time.
