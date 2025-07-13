#! /bin/bash

cat .mtoolsrc
mdir X:
curl -LO 'https://gitlab.com/FreeDOS/base/fdapm/-/raw/master/BIN/FDAPM.COM?ref_type=heads&inline=false'
mcopy FDAPM.COM X:
mcopy config.sys X:
mcopy autoexec.bat X:
mcopy run.bat X:
