#! /bin/bash

set -e

curl ${SKIP_EXISTING} -O https://pushbx.org/ecm/download/edrdos/d110721b.zip
unzip d110721b.zip
mcopy DRBIO.SYS DRDOS.SYS COMMAND.COM X:
curl ${SKIP_EXISTING} -LO 'https://gitlab.com/FreeDOS/base/fdapm/-/raw/master/BIN/FDAPM.COM?ref_type=heads&inline=false'
mcopy FDAPM.COM X:
mcopy config.sys X:
mcopy autoexec.bat X:
mcopy run-arj.bat X:run.bat
mcopy shutdown.bat X:

# THE BUILD SOURCE
curl ${SKIP_EXISTING} -LO 'https://downloads.sourceforge.net/project/arj/arj/2.78_3.10%20build%2022/arj-3.10.22.tar.gz?ts=gAAAAABpRteyghVC3czDpyIqr6decYgCLPLk3xU0VI68wpJK2AmCVqW0K_7f3tyfQHVh5EU0VZuZxcSmA2tnS8BT2F4tfleXyQ%3D%3D&r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Farj%2Ffiles%2Farj%2F2.78_3.10%2520build%252022%2Farj-3.10.22.tar.gz%2Fdownload'
# => arj-3.10.22.tar.gz

tar xf arj-3.10.22.tar.gz
mv arj-3.10.22 arj
mkdir -p arj/bc31/en/rs/tools
mcopy -sm arj X:

tar xf cpp31.tar
sed -ie 's/E:\\CLEAN/C:/' cpp31/BIN/TURBOC.CFG
mcopy -sm cpp31 X:
tar xf masm611.tar
mcopy -sm MASM611 X:
tar xf msvc.tar
mcopy -sm MSVC X:
