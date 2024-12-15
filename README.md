This repo contains a Dockerfile and a .sbg file that can be used to build a Docker image for sbagen. Running sbagen on docker is a reliable way to run the 32-bit sbagen program on any OS that supports Docker.

# Example
- run docker image with the provided .sbg file, and output the resulting .wav file to the current directory:
```
docker pull waynehoover/sbagen:latest
docker run --platform linux/amd64 --rm -v .:/data sbagen /data/deltabox.sbg
```
# Build
docker build --platform linux/amd64 -t sbagen .
