# syntax=docker/dockerfile:1.7
FROM busybox:1.36

WORKDIR /app

# Copy vs Add demo
COPY local-archive.tar.gz /copy-target/
ADD local-archive.tar.gz /add-target/

# Remote URL (demonstration only — not recommended)
# ADD https://example.com/some.tar.gz /remote-download/

CMD ["sh", "-lc", "ls -la /copy-target /add-target || true"]
