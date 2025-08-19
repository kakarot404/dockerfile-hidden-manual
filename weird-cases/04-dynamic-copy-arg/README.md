# Dynamic COPY with ARG

Why: Demonstrates how to include different config files with --build-arg (dev vs prod).

- Build with: `DOCKER_BUILDKIT=1 docker build --build-arg TARGET=prod -t wc-dyn:prod .`
- This allows single Dockerfile to produce env-specific images.

__Pitfall :__ 
- YOU MUST PASS the build-arg. Failing to do so will use the default (dev here).

__Interview callout :__  
- Show understanding of ARG scope (before/after FROM) and re-declaration if needed.
