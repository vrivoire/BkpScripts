@echo off
chcp 65001
SETLOCAL ENABLEDELAYEDEXPANSION

echo:
@echo HOMEDRIVE   %HOMEDRIVE%
@echo HOMEPATH    %HOMEPATH%
@echo USERDOMAIN  %USERDOMAIN%
@echo USERNAME    %USERNAME%
@echo AppData     %AppData%
echo:

title Nuage

echo:
@echo -------------------------------------------------------------------------
@echo Nuage
@echo -------------------------------------------------------------------------
for %%G in ("GoogleDrive\Mon disque" OneDrive Mega Icedrive TeraBox) DO (
	set TAG=%%~G
	@echo PoidsPression vers !TAG! == %%~G ---------------------------------------------------	
	"C:\Program Files\FreeFileSync\FreeFileSync.exe" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\Ventile\Nuage-SyncSettings.ffs_batch"
	call :error
	
	dir /s /b "C:\Users\ADELE\!TAG!\*.ffs_tmp"
	del /s /q /f "C:\Users\ADELE\!TAG!\*.ffs_tmp"
	@echo ------
)
@echo Fin Nuage ---------------------------------------------------------------
exit

:error
	if not %errorlevel% == 0 (
		echo errorlevel=%errorlevel%
		if %errorlevel% == 1 (
			echo Synchronization completed with warnings	
			
		)
		if %errorlevel% == 2 (
			start explorer %HOMEDRIVE%%HOMEPATH%\AppData\Roaming\FreeFileSync\Logs
			echo Synchronization completed with errors
			pause
		)	
		if %errorlevel% == 3 (
			echo Synchronization was aborted
			pause
		)		
	)
	goto :eof