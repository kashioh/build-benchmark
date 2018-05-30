#!/bin/bash
set -e

echo ">$@<"
whoami
cd /home/user
pwd
ls -l

if [[ -z $2 ]]; then
    CORE_COUNT="$(grep -c ^processor /proc/cpuinfo)"
else
    CORE_COUNT="$2"
fi

echo "Jobs: ${CORE_COUNT}"

case "$1" in
    "linux-4.14.43"|linux)
        time tar xf linux*
        cd linux-4.14.43
        time make defconfig
        time make -j ${CORE_COUNT}
        ;;
    "qt-everywhere-opensource-src-5.7.1"|qt)
        time tar xf qt-everywhere-opensource-src-5.7.1.tar.gz
        cd qt-everywhere-opensource-src-5.7.1
        time ./configure -opensource -confirm-license -no-compile-examples
        time make -j ${CORE_COUNT}
        ;;
    *)
        echo "Please run: docker run --user user --rm -i build-benchmark [linux-4.14.43|qt-everywhere-opensource-src-5.7.1] [n jobs]"
        ;;
esac

