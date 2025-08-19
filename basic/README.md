# Dockerfile 101 — Basic Dockerfile Concepts

This folder demonstrates **fundamental Dockerfile concepts** and serves as a companion to the *“Dockerfile 101”* section of the [Dockerfile — The Hidden Manual](../README.md) blog.

---

## What You'll Learn

These examples help you understand:

- What a Dockerfile is and how it's structured.
- How image layers and build cache work.
- The role of `.dockerignore` in reducing build context
- How to write clean, minimal Dockerfiles
- The impact of small decisions on build performance and image size

---

## Files in This Folder -

| File | Purpose |
|------|---------|
| `Dockerfile` | Base Dockerfile demonstrating best practices |
| `.dockerignore` | Ignore file to exclude unnecessary files from build context |
| `README.md` | This guide |

---

## Getting Started

### Build the Docker Image

To build the Docker image from the provided Dockerfile :

```bash
docker build -t dockerfile-basic-example .
```
▶ Run the Container
```bash
docker run --rm -p 3000:3000 dockerfile-basic-example
```
The sample app (if present) will run on port 3000. You can modify the image to use any sample Node.js, Python, or shell-based app.

 - In case you dont have any nodejs app you can find one 

    - [Here](https://github.com/nodejs/examples/)  OR  
    - [Here](https://www.geeksforgeeks.org/node-js/deploying-node-js-applications/) OR
    - you can use most basic one mentioned in this directory. (index.js, package.json) 

## Key Dockerfile Concepts Covered

1. Parser Directive -
    ```Dockerfile
    # syntax=docker/dockerfile:1.5
    ```
    - This tells Docker to use BuildKit with Dockerfile v1.5 features.
    - It must be the first non-comment line in the file.

2. Base Image -
    ```Dockerfile
    FROM node:18
    ```
    - We use an official Node.js image as the base layer.

3. Working Directory -
    ```Dockerfile
    WORKDIR /app
    ```
    - Sets the working directory inside the image/container.
    - Prevents repetition of full paths like `/app/....`

3. Copying Files -
    ```Dockerfile
    COPY . .
    ```
    - Copies build context (filtered by .dockerignore) into the container.

4. Caching with BuildKit -
    ```Dockerfile
    RUN --mount=type=cache,target=/root/.npm \
        npm install
    ```
    - Uses BuildKit’s RUN --mount=type=cache to cache dependencies across builds.
    - Great for speeding up rebuilds.

5. Entrypoint Command -
    ```Dockerfile
    CMD ["node", "index.js"]
    ```
    - This is the default command that runs when the container starts.

🛑 Common Pitfalls Highlighted

    Forgetting to use .dockerignore → large build context and slow builds

    Using COPY . . without context awareness

    Not pinning base image versions (e.g., using node:latest)

📎 Related Blog Sections

1.1 – [What really is a Dockerfile?]()

1.2 – [Image layers and build cache explained simply]()

1.3 – [Build context: .dockerignore, context size, and pitfalls]()

1.4 – [Anatomy of a clean Dockerfile]()

🔗 Blog links will be updated when the blog is published.


## 🤗 Contributing

Feel free to fork and contribute improvements, corrections, or additional examples!