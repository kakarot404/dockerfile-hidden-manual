# Heredoc RUN

Why: Using heredoc in RUN makes long shell sequences readable and safer (fail-fast, more deterministic). Useful to show production-style one-layer cleanups.

- Makes multi-step RUNs readable and keeps them in one layer (helpful for cleanup).
- Using `set -euo pipefail` increases safety (CI-friendly).
- Pitfall: heredoc delimiting must be quoted if you want exact contents (see '<<' vs '<<'').

**Run**
`DOCKER_BUILDKIT=1 docker build -t wc-heredoc . && docker run --rm wc-heredoc`

__Interview callout :__  
- Use heredoc for complex install scripts to reduce layers and improve readability.
