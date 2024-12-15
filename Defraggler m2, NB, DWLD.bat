@echo off
@echo ...................................................

set PATH_LIST=%PATH_LIST% %HOMEDRIVE%%HOMEPATH%\AppData\Roaming\NetBeans 
set PATH_LIST=%PATH_LIST% %HOMEDRIVE%%HOMEPATH%\AppData\LocalLow\Sun 
set PATH_LIST=%PATH_LIST% %HOMEDRIVE%%HOMEPATH%\AppData\LocalLow\Oracle
set PATH_LIST=%PATH_LIST% %HOMEDRIVE%%HOMEPATH%\.m2
set PATH_LIST=%PATH_LIST% %HOMEDRIVE%%HOMEPATH%\Documents
set PATH_LIST=%PATH_LIST% %HOMEDRIVE%%HOMEPATH%\Downloads
set PATH_LIST=%PATH_LIST% %HOMEDRIVE%%HOMEPATH%\Livres
set PATH_LIST=%PATH_LIST% %HOMEDRIVE%%HOMEPATH%\Videos
set PATH_LIST=%PATH_LIST% %HOMEDRIVE%%HOMEPATH%\eclipse
set PATH_LIST=%PATH_LIST% %ProgramData%
set PATH_LIST=%PATH_LIST% "%ProgramFiles%"
set PATH_LIST=%PATH_LIST% "%ProgramFiles(x86)%"

for %%A in (%PATH_LIST%) do call :defrag %%A

contig64 -q $Mft
contig64 -q $LogFile
contig64 -q $Volume
contig64 -q $AttrDef
contig64 -q $Bitmap
contig64 -q $Boot
contig64 -q $BadClus
contig64 -q $Secure
contig64 -q $UpCase
contig64 -q $Extend

@echo Done!
pause
exit

:defrag
@echo Defragmenting: %1
contig64 -s -q %1
@echo ...................................................
exit /b

pause
