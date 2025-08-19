# 🚀 Production-Ready Dockerfile

This example demonstrates **production-grade Dockerfile practices** — minimal, secure, observable, and Kubernetes-friendly.

---

## Key Features in This Dockerfile

1. **Pinned Base Image**
   - Uses `node:22-slim` instead of `node:latest` for reproducibility and smaller footprint.

2. **Non-Root User with Fixed UID/GID**
   - Creates `app:10001` user/group.
   - Prevents containers from running as root.
   - Fixed UID/GID avoids permission issues with mounted volumes in Kubernetes.

3. **Dependency Install (Optimized)**
   - Installs only production dependencies:
     ```dockerfile
     npm ci --omit=dev --ignore-scripts
     ```
   - Uses BuildKit cache to speed up rebuilds.

4. **OCI Metadata Labels**
   - Adds `org.opencontainers.image.*` labels.
   - Useful for inventories, SBOMs, and scanners like Trivy/Anchore.

5. **Environment Configuration**
   - Sets `NODE_ENV=production` → enables Node.js runtime optimizations.

6. **Healthcheck**
   - Lightweight check using Node’s HTTP module.
   - Allows orchestrators (Docker/K8s) to restart unhealthy containers.

7. **Non-Root Runtime**
   - Enforces security by switching to `USER 10001:10001`.

---

## 🛠 Building & Running

```bash
# Build image
docker build -t prod-ready-example ./prod-ready

# Run container
docker run --rm -p 3000:3000 prod-ready-example
```
Visit http://localhost:3000


## Related Blog Sections

4.1 – Non-root users in containers (why & how)

4.2 – Image metadata (OCI labels, SBOM-friendly builds)

4.3 – Healthchecks and container observability

4.4 – Pinning dependencies and base images

## Common Pitfalls

Running as root (major security risk in production).

Forgetting OCI labels → scanners can’t pick up metadata.

Not pinning base image → builds may suddenly break with upstream changes.

Ignoring healthchecks → failures only surface at runtime.