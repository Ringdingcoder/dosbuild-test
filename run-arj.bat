@echo off

path C:\msvc\bin;C:\cpp31\bin;C:\masm611\bin
cd arj
nmake MODE=DOS16 COMPILER=BC31
bc31\en\rs\arj\arj ar arj *.*

cd ..
shutdown
