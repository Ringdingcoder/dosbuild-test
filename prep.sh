#! /bin/bash

mdir X:
curl -LO 'https://gitlab.com/FreeDOS/base/fdapm/-/raw/master/BIN/FDAPM.COM?ref_type=heads&inline=false'
curl -L -o doslfn.zip 'http://adoxa.altervista.org/doslfn/dl.php?f=doslfn'
unzip doslfn.zip
curl -LO https://github.com/Baron-von-Riedesel/HX/releases/download/v2.22/HXRT222.zip
unzip HXRT222.zip
mcopy FDAPM.COM X:
mcopy doslfn.com X:
mcopy BIN/HDPMI32.EXE X:
mcopy config.sys X:
mcopy autoexec.bat X:
mcopy run.bat X:

mkdir dz
cd dz
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2/djdev205.zip
mkdir ../djgpp
cd ../djgpp
unzip ../dz/djdev205.zip
cd ..

mcopy -sm djgpp X:
