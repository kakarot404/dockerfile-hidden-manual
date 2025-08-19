# Multistage Build: Alpine as Final Runtime Image

This example shows how to optimize a Docker image by using **Alpine Linux** as the base image in the final runtime stage.

---

## Why Use Alpine?

- Super lightweight (~5 MB)
- Smaller attack surface (fewer pre-installed packages)
- Great for production, especially for statically built or pure Node apps

---

## Build the Image

```bash
docker build -t node-alpine-final .
```

▶  Run the Container :
```bash
docker run --rm -p 3000:3000 node-alpine-final
```
Highlights
- Multistage build separates dev tools from the final runtime
- Alpine keeps the final image size small
- No dev dependencies or build tools are shipped in final container

⚠  Alpine Caution -

If your Node.js app requires native modules (e.g. bcrypt, sharp, etc.), you may need to:
- Use apk add --no-cache build-base python3 in the builder
- Stick to node:slim for final image if native modules fail on Alpine

📎 Related Blog Section

3.3 – [Adding Alpine in Final Stage]()

3.4 – [Cleaning up after build tools]()
