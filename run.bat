@echo off
doslfn
hdpmi32 -r
path C:\djgpp\bin;C:\
set DJGPP=C:/djgpp/djgpp.env
ls

cd bash\0build
del config.cache
make clean
call ..\djgpp\config ./.. no-nls
make

shutdown
