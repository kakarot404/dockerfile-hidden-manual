# 🏗 Multistage Build: Node.js App (Builder → Runtime Split)

This example demonstrates a **multistage Docker build** to separate the build process from the final runtime image.

---

## What This Teaches

- Use of multiple `FROM` instructions to isolate build and runtime stages
- Reducing image size by avoiding dev dependencies
- Cleaner, production-ready containers
- Caching benefits from copying `package.json` before source code

---

##  Build the Image

```bash
docker build -t node-multistage-example .
```

▶ Run the Container
```bash
docker run --rm -p 3000:3000 node-multistage-example
```
## Why Multistage?

- Keeps your final image small and secure
- Avoids shipping build tools or unused dependencies
- Keeps Dockerfiles clean and cache-efficient

## Gotchas

- Use `npm install` only when developing locally and you want to add/upgrade packages. In production or CI, stick with `npm ci`.
- Always copy package*.json before full source — improves caching
- Watch for unnecessary COPY commands into the final image
- Ensure secrets or build-time files (like .env) don’t leak into final stage
- Kindly follow the explaination for `RUN` instruction used in Dockerfile.
    
    `RUN --mount=type=cache,target=/root/.npm 
    npm ci --omit=dev --ignore-scripts`

    Where ;
    1. `--mount=type=cache,target=/root/.npm` -
        - Creates a persistent cache directory at `/root/.npm` that survives across builds on the same machine.
        - Eg. First build (cold cache): 
            ```bash
            docker build -t app .
            # downloads all ~200MB of deps
            ```
        - Eg. Second build (warm cache, no dep changes):
            ```bash
            docker build -t app .
            # uses cached deps, installs instantly
            ```
    2. `npm ci` - clean, reproducible install.

    3. `--omit=dev` - 
        - Equivalent of `--only=prod`
        - Installs only production dependencies from `package.json`.

    4. `--ignore-scripts` - 
        - Skips preinstall, postinstall, and lifecycle scripts in package.json.

    Note : Kindly follow the link to understand more about use of the flag `--ignore-scripts` : [can-ignore-scripts](https://www.npmjs.com/package/can-i-ignore-scripts)


🔗 Next

 ../alpine-final → Final image using Alpine for minimal footprint
