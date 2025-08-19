# syntax=docker/dockerfile:1.7
FROM wc-onbuild-base:demo
WORKDIR /app
COPY index.js .
CMD ["node","index.js"]
