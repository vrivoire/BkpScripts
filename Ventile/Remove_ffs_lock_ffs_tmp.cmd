REM @echo off
REM cls
REM chcp 65001
REM SETLOCAL ENABLEDELAYEDEXPANSION

REM echo:
REM @echo HOMEDRIVE   %HOMEDRIVE%
REM @echo HOMEPATH    %HOMEPATH%
REM @echo USERDOMAIN  %USERDOMAIN%
REM @echo USERNAME    %USERNAME%
REM @echo AppData     %AppData%
REM echo:
REM echo:
REM @echo -------------------------------------------------------------------------
REM @echo Cleanup *.ffs_tmp
REM @echo -------------------------------------------------------------------------
REM echo:
REM for %%G in (C E F G I K) DO (
	REM set TAG=%%~G:
	REM @echo !TAG!
	REM !TAG!
	REM cd !TAG!\
	REM @echo dir
	REM dir /s /b !TAG!\*.ffs_tmp
	REM @echo del
	REM del /q /f /s !TAG!\*.ffs_tmp
	REM @echo rd
	REM for /d /r . %%d in (RecycleBin*.ffs_tmp) do rd /s /q "%%d"
	REM @echo -------------------------------------------------------------------------
REM )
REM pause

pwsh.exe -ExecutionPolicy Bypass -File "C:\Users\ADELE\Documents\BkpScripts\Ventile\Remove_ffs_lock_ffs_tmp.ps1"
pause