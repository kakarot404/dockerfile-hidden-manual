# syntax=docker/dockerfile:1.7
FROM python:3.12-slim

WORKDIR /app
COPY requirements.txt .

# Use build secret (pip config) and ssh for private repos
RUN --mount=type=secret,id=pip_conf,target=/etc/pip.conf \
    --mount=type=ssh \
    --mount=type=cache,target=/root/.cache/pip \
    pip install -r requirements.txt

COPY . .
CMD ["python","-c","print('secrets demo')"]
