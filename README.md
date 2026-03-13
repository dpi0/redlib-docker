# Redlib Docker

Custom [redlib](https://github.com/redlib-org/redlib#docker) Docker image.

Image built to fix the [rate limit issue](https://github.com/redlib-org/redlib/issues/446) with this [solution](https://github.com/redlib-org/redlib/issues/446#issuecomment-3918036966).

## How to Use?

```bash
docker pull dpi0/redlib-docker:v1.0.0

docker compose --file /path/to/dpi0-redlib-docker/compose.yaml up -d
```

This will spin up redlib on `127.0.0.1:8080`.
