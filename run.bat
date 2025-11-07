@echo off
shsurdrv 600M
doslfn
hdpmi32 -r

D:
C:\djgpp\bin\tar x C:/djgpp.tar
C:\djgpp\bin\tar x C:/bash.tar

path D:\djgpp\bin;C:\
set DJGPP=D:/djgpp/djgpp.env
ls

cd bash\0build
del config.cache
make clean
call ..\djgpp\config ./.. no-nls
make
copy bash.exe C:
copy sh.exe C:

shutdown
