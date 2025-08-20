# Docker Multistage Build Examples

This repository showcases **Docker multistage build patterns** to create optimized, production-ready container images. Each subfolder demonstrates a specific technique or use case using multistage Docker builds.

---

## Structure -

```
.
├── README.md           ← You're here
├── alpine-final/       ← Alpine Linux used in final runtime stage
│ ├── Dockerfile
│ └── README.md
└── node-builder-runtime/ ← Node.js multistage with builder/runtime split
├── Dockerfile
└── README.md
```

---

## What is a Multistage Build?

A multistage build allows you to **use multiple `FROM` statements** in your Dockerfile. This helps:

- Build your app with all necessary tools
- Then copy only the needed artifacts into a clean runtime image
- Resulting in **smaller, faster, and more secure** containers

---

## Examples

### 1. [`node-builder-runtime/`](./node-builder-runtime)

**Multistage Build: Node.js App (Builder → Runtime Split)**  
Uses a two-stage Dockerfile to build a Node.js app in one stage, then copy the compiled code into a clean runtime image.

Highlights:
- Isolates build and runtime stages
- Uses caching to speed up builds
- Demonstrates production-ready `npm ci` with cache mounts

[Read more →](./node-builder-runtime/README.md)

---

### 2. [`alpine-final/`](./alpine-final)

**Multistage Build: Alpine as Final Runtime Image**  
Builds the app in a full-featured image, but delivers it using **Alpine Linux** for minimal footprint.

Highlights:
- Lightweight (~5MB) final image
- Ideal for static binaries or simple Node apps
- Notes gotchas with native modules on Alpine

[Read more →](./alpine-final/README.md)

---

## Learn More

These examples are ideal if you're learning about:

- Docker image optimization
- Securing containers by removing unnecessary tools
- Managing dependencies across stages
- Trade-offs with base images (e.g., Alpine vs Slim)

---

## 🔗 Related Resources

- [Docker Multistage Builds (Official Docs)](https://docs.docker.com/develop/develop-images/multistage-build/)
- [Best practices for writing Dockerfiles](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Node.js Docker Best Practices](https://github.com/nodejs/docker-node/blob/main/docs/BestPractices.md)

---

Feel free to explore each subfolder for detailed README files and Dockerfiles.
