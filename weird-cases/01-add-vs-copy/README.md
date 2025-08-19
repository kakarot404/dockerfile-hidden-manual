# ADD vs COPY

- `COPY` simply copies files from build context.
- `ADD` will extract a local tar.gz into the image and can download remote URLs at build time.
- Pitfalls:
  - Using `ADD` with remote URLs breaks caching and reproducibility.
  - Unexpected auto-extract can bloat final images.

**Run**
1. create a small tar: `tar czf local-archive.tar.gz somefile`
2. `DOCKER_BUILDKIT=1 docker build -t wc-add-copy .`
3. `docker run --rm wc-add-copy ls -la /add-target /copy-target`

__Interview callout :__ 
- Prefer COPY. 
- Use ADD only when you need auto-extract and understand the consequences.
