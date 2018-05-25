# build-benchmark

## Local build

    docker build -t build-benchmark .
    docker run --user user --rm -it build-benchmark linux-4.14.43

## Run from Docker Hub

    docker pull tinytux/build-benchmark
    docker run --user user --rm -it tinytux/build-benchmark linux-4.14.43
