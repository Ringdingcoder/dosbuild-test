#! /bin/bash

set -e

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
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/deleted/v2gnu/bsh4428b.zip
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/fil41br3.zip
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/deleted/v2gnu/mak41br2.zip
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/fnd4233br5.zip
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/txi413br3.zip
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/txt20br3.zip
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/grep228b.zip
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/bnu2351b.zip
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/gcc930b.zip
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/dif37b.zip
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/gwk500b.zip
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/sed48b.zip
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/tar112abr2.zip
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/shl2011br3.zip
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/m4-1419b.zip
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/bsn241br2.zip

# THE BUILD SOURCE
curl -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/bsh4428s.zip

mkdir ../djgpp
cd ../djgpp
set +e
unzip ../dz/djdev205.zip
unzip ../dz/bsh4428b.zip
unzip ../dz/fil41br3.zip
unzip ../dz/mak41br2.zip
unzip ../dz/fnd4233br5.zip
unzip ../dz/txi413br3.zip
unzip ../dz/txt20br3.zip
unzip ../dz/grep228b.zip
unzip ../dz/bnu2351b.zip
unzip ../dz/gcc930b.zip
unzip ../dz/dif37b.zip
unzip ../dz/gwk500b.zip
unzip ../dz/sed48b.zip
unzip ../dz/tar112abr2.zip
unzip ../dz/shl2011br3.zip
unzip ../dz/m4-1419b.zip
unzip ../dz/bsn241br2.zip
set -e

ls -l manifest
cd ..
mcopy -sm djgpp X:

unzip dz/bsh4428s.zip
mv gnu/bash* gnu/bash
cd gnu/bash
patch -p1 < ../../bash-sigchld.patch
mcopy -sm ../bash X:
