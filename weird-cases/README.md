# weird-cases — small, focused Dockerfile edge-case demos

This folder contains small examples that demonstrate tricky or surprising Dockerfile behaviors:
- `01-add-vs-copy` — ADD auto-extract and remote URL pitfalls
- `02-heredoc-run` — readable, safe multi-line RUN using heredoc + strict flags
- `03-secret-and-ssh-mounts` — BuildKit secrets and ssh forwarding (no layering of creds)
- `04-dynamic-copy-arg` — use ARG to conditionally COPY different config files
- `05-onbuild-trap` — ONBUILD behavior and why it's dangerous in many cases
- `06-cache-busting-patterns` — patterns to preserve cache and avoid accidental busting
- `07-selective-multi-stage` — copy only runtime artifacts into final image

Each folder includes a README with build instructions and the Dockerfile to copy into your repo.

# NOTE: BuildKit required for many examples
export DOCKER_BUILDKIT=1