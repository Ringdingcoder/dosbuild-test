#! /bin/bash

zstd -d < caldera-test.raw.zst > caldera.raw
echo "drive x: file="$PWD/caldera.raw" offset=32256" > ~/.mtoolsrc
mdir X:
