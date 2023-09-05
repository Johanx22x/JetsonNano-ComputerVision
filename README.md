# Jetson Nano Setup

## Setup

```sh
docker build . -t jetson-nano:latest
```

## Run

```sh
docker run -it --rm --device /dev/video0 jetson-nano:latest bash
```
