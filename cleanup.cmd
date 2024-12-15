@echo off

echo %SystemRoot%\Temp
echo %HOMEDRIVE%%HOMEPATH%


@echo .
@echo Netoie les fichiers temporaires
@echo .

rem @echo clean up ----------------------------------------
rem cd %HOMEDRIVE%%HOMEPATH%\Documents\NetBeansProjects
rem FOR %%A IN (dailyJobs daphne-resin4 MAG trunk vrivoire canpost mandrill authorizations) DO CALL :clean-up %%A

rem C:\Users\rivoi\Documents\NetBeansProjects\ImdbSearch
rem C:\Users\rivoi\Documents\NetBeansProjects\ImdbSearch\bin
rem C:\Users\rivoi\Documents\NetBeansProjects\PycharmProjects\PoidsPression\dist
@echo Logs --------------------------------------------
@echo %TEMP% --------------------------------------------
cd %TEMP%
del /F /S /Q *.*
rmdir /s /q ..\Temp

@echo Local\Temp --------------------------------------------
cd %HOMEDRIVE%%HOMEPATH%\AppData\Local\Temp
del /F /S /Q *.*
rmdir /s /q ..\Temp

@echo LocalLow\Temp --------------------------------------------
cd %HOMEDRIVE%%HOMEPATH%\AppData\LocalLow\Temp
del /F /S /Q *.*
rmdir /s /q ..\Temp

@echo BitTorrent --------------------------------------------
cd %HOMEDRIVE%%HOMEPATH%\AppData\Roaming\BitTorrent
del /F /S /Q *.torrent
cd %HOMEDRIVE%%HOMEPATH%\AppData\Roaming\uTorrent
del /F /S /Q *.torrent

@echo ImdbSearch ---------------------------------------------------
cd "%HOMEDRIVE%%HOMEPATH%\Documents\NetBeansProjects\ImdbSearch\bin"
del /F /S /Q *.log

@echo FreeFileSync ---------------------------------------------------
cd %HOMEDRIVE%%HOMEPATH%\AppData\Roaming\FreeFileSync\Logs
del /F /S /Q *.*

@echo Else... ---------------------------------------------------
@echo on
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Microsoft\Edge\User Data\Default\Sync Data\Logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Packages\DellInc.MyAlienware_htrsf667h5kn2\LocalState\Logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\FreeFileSync\Logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Packages\Microsoft.XboxGamingOverlay_8wekyb3d8bbwe\LocalState\Logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Packages\MicrosoftTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\Logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Microsoft\OneDrive\setup\logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Packages\AppleInc.iCloud_nzyj5cx40ttqa\LocalCache\Local\Logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Google\DriveFS\Logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Local\NordVPN\logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Packages\AppleInc.iCloud_nzyj5cx40ttqa\LocalCache\Roaming\Apple Computer\Logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Zoom\logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Dropbox\logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Microsoft\BingWallpaperApp\Log"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Microsoft\BingSvc\Log"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Packages\Microsoft.GamingServices_8wekyb3d8bbwe\LocalState\Logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\NetBeans\17\var\log"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Packages\AppleInc.iCloud_nzyj5cx40ttqa\LocalCache\Local\Apple Inc\Logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Dell\Dell Peripheral Manager\DPM\Log"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\msfs2020-map-enhancement\logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Microsoft\Edge\User Data\Default\Continuous Migration\Logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Weather Bar\logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Local\Microsoft\OneDrive\logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\Roaming\Mozilla\Firefox\Profiles\gwsrml0l.default-release\weave\logs"
del /F /S /Q *.*
cd "%HOMEDRIVE%%HOMEPATH%\AppData\LocalLow\Sun\Java\Deployment\log"
del /F /S /Q *.*



@echo Windows\Temp --------------------------------------------
cd %SystemRoot%\Temp
del /F /Q /S *
cd ..
rmdir /s /q Temp
mkdir Temp

@echo Reset an Internet Connection --------------------------------------------
call ipconfig /release
call ipconfig /flushdns
call ipconfig /renew
call netsh int ip reset
call netsh winsock reset

@echo .
FOR %%A IN ($MFT $LogFile $Volume $AttrDef $Bitmap $Boot $BadClus $Secure $UpCase $Extend) DO CALL :CONTIG %%A

rem pause
exit

:CONTIG
echo -------------------- %1 ----------------------
call contig64 -nobanner -q -s C:\%1
@echo .
exit /B

:clean-up
echo -------------------- clean up %1 ----------------------
cd %HOMEDRIVE%%HOMEPATH%\Documents\NetBeansProjects\Daphne\svn\%1

del /F /S /Q *.class
del /F /S /Q _*.java

rmdir /S /Q %HOMEDRIVE%%HOMEPATH%\Documents\NetBeansProjects\Daphne\svn\%1\log 
rmdir /S /Q %HOMEDRIVE%%HOMEPATH%\Documents\NetBeansProjects\Daphne\svn\%1\build 
rmdir /S /Q %HOMEDRIVE%%HOMEPATH%\Documents\NetBeansProjects\Daphne\svn\%1\log
rmdir /S /Q %HOMEDRIVE%%HOMEPATH%\Documents\NetBeansProjects\Daphne\svn\%1\Sessions 
rmdir /S /Q %HOMEDRIVE%%HOMEPATH%\Documents\NetBeansProjects\Daphne\svn\%1\tmp 
rmdir /S /Q %HOMEDRIVE%%HOMEPATH%\Documents\NetBeansProjects\Daphne\svn\%1\work 
rem pause
rem svn up
@echo .
exit /B

:END
pause
