#! /bin/bash

set -e

curl --skip-existing -O https://pushbx.org/ecm/download/edrdos/d110721b.zip
unzip d110721b.zip
mcopy DRBIO.SYS DRDOS.SYS COMMAND.COM X:
curl --skip-existing -LO 'https://gitlab.com/FreeDOS/base/fdapm/-/raw/master/BIN/FDAPM.COM?ref_type=heads&inline=false'
curl --skip-existing -O http://adoxa.altervista.org/doslfn/doslfn.zip
unzip doslfn.zip
curl --skip-existing -LO https://github.com/Baron-von-Riedesel/HX/releases/download/v2.22/HXRT222.zip
curl --skip-existing -LO https://github.com/Baron-von-Riedesel/HimemX/releases/download/v3.39/HimemX339.zip
curl --skip-existing -O http://adoxa.altervista.org/shsufdrv/fdrv-3.zip
unzip HXRT222.zip
unzip HimemX339.zip
unzip -o fdrv-3.zip
mcopy FDAPM.COM X:
mcopy doslfn.com X:
mcopy BIN/HDPMI32.EXE X:
mcopy HimemX.exe X:
mcopy shsurdrv.exe X:
mcopy config.sys X:
mcopy autoexec.bat X:
mcopy run.bat X:
mcopy shutdown.bat X:

mkdir -p dz
cd dz
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2/djdev205.zip
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/bsh4428b.zip
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/fil41br3.zip
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/mak44b.zip
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/fnd4233br5.zip
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/txi413br3.zip
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/txt20br3.zip
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/grep228b.zip
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/bnu2351b.zip
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/gcc930b.zip
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/dif37b.zip
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/gwk500b.zip
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/sed48b.zip
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/tar112abr2.zip
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/shl2011br3.zip
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/m4-1419b.zip
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/bsn241br2.zip

# THE BUILD SOURCE
curl --skip-existing -O https://www.mirrorservice.org/sites/ftp.delorie.com/pub/djgpp/current/v2gnu/bsh4428s.zip

mkdir -p ../djgpp
cd ../djgpp
set +e
unzip ../dz/djdev205.zip
unzip ../dz/bsh4428b.zip
unzip ../dz/fil41br3.zip
unzip ../dz/mak44b.zip
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

mcopy bin/tar.exe X:
ls -l manifest
cd ..
tar cf djgpp.tar djgpp
mcopy djgpp.tar X:

unzip dz/bsh4428s.zip
mv gnu/bash* gnu/bash
cd gnu/bash
patch -p1 < ../../bash-sigchld.patch
cd ..
tar cf bash.tar bash
mcopy bash.tar X:
mdir X:
