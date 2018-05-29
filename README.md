# build-benchmark

## Local build

    docker build -t build-benchmark .
    docker run --user user --rm -i build-benchmark linux-4.14.43
    docker run --user user --rm -i build-benchmark qt-everywhere-opensource-src-5.7.1


## Run from Docker Hub

    docker pull tinytux/build-benchmark
    docker run --user user --rm -i tinytux/build-benchmark linux
    docker run --user user --rm -i tinytux/build-benchmark qt

