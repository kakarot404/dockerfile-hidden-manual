# syntax=docker/dockerfile:1.7
FROM debian:12-slim

WORKDIR /app

# heredoc RUN with strict flags
RUN <<'SH'
set -euo pipefail
apt-get update
apt-get install -y --no-install-recommends curl ca-certificates
# Do some setup
id -u nobody >/dev/null 2>&1 || adduser --disabled-password --gecos "" app || true
rm -rf /var/lib/apt/lists/*
SH

CMD ["sh", "-c", "echo heredoc ok && id -u app || true"]
