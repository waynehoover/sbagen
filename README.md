This repo contains a Dockerfile that can be used to build a Docker image for sbagen.

Running sbagen on docker is a reliable way to run the 32-bit sbagen program on any OS that supports Docker.

Also include is an example .sbg file.

# Example
- run docker image with the provided .sbg file, and output the resulting .wav file to the current directory:
```
docker pull waynehoover/sbagen:latest
docker run --platform linux/amd64 --rm -v .:/data sbagen /data/deltabox.sbg
```
# Build
docker build --platform linux/amd64 -t sbagen .


## Thanks and Credits
Thanks to the sbagen aur package mantainers for keeping sbagen buildable on Arch Linux.
https://aur.archlinux.org/packages/sbagen

And of course, a million thanks to Jim Peters for creating sbagen.
https://uazu.net/sbagen/