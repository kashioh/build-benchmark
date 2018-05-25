#!/bin/bash
set -e

echo ">$@<"
whoami
cd /home/user
pwd
ls -l
CORE_COUNT="$(grep -c ^processor /proc/cpuinfo)"

if [ "$1" = 'linux-4.14.43' ]; then
    time tar xf linux*
    cd $1
    time make defconfig
    time make -j ${CORE_COUNT}
else
    echo "Please run: docker run --user user --rm -it build-benchmark [linux-4.14.43]"
fi

