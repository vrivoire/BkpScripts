@echo off
chcp 65001
SETLOCAL ENABLEDELAYEDEXPANSION

echo:
@echo HOMEDRIVE   %HOMEDRIVE%
@echo HOMEPATH    %HOMEPATH%
@echo USERDOMAIN  %USERDOMAIN%
@echo USERNAME    %USERNAME%
@echo AppData     %AppData%
@echo:

REM @echo Unblock-File...
REM pwsh.exe -ExecutionPolicy Bypass -File "C:\Users\ADELE\Documents\BkpScripts\Ventile\Unblock-File.ps1"

REM echo:
REM @echo -------------------------------------------------------------------------
REM @echo PoidsPression
REM @echo -------------------------------------------------------------------------
REM start PoidsPression.cmd
REM @echo Fin PoidsPression ---------------------------------------------------------------

title Ventile 4

echo:
@echo -------------------------------------------------------------------------
@echo usb_key
@echo -------------------------------------------------------------------------
start "USB Key" %HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\Ventile\usb_key.cmd"
@echo Fin usb_key -------------------------------------------------------------

@echo -------------------------------------------------------------------------
@echo Videos
@echo -------------------------------------------------------------------------
start "Videos" %HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\Ventile\Videos.cmd"
@echo Fin Videos --------------------------------------------------------------

echo:
@echo -------------------------------------------------------------------------
@echo Nuage
@echo -------------------------------------------------------------------------
start "Nuage" %HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\Ventile\Nuage.cmd"
@echo Fin Nuage ---------------------------------------------------------------

echo:
@echo -------------------------------------------------------------------------
@echo Programs
@echo -------------------------------------------------------------------------
start "Programs" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\Ventile\bkp2.cmd" A Programs
@echo Fin Programs -----------------------------------------------------------

echo:
@echo -------------------------------------------------------------------------
@echo Documents
@echo -------------------------------------------------------------------------
start "Documents" %HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\Ventile\Documents.cmd"
@echo Fin Documents -----------------------------------------------------------

echo:
@echo Fin ffs_batch -----------------------------------------------------------
echo:

@echo Ventile 4 - Done!
@echo %HOMEDRIVE%%HOMEPATH%\AppData\Roaming\FreeFileSync\Logs
rem pause
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

:Cleanup_ffs
	echo:
	@echo -------------------------------------------------------------------------
	@echo Cleanup sync*.ffs_lock
	@echo -------------------------------------------------------------------------
	@echo off
	rem https://superuser.com/questions/1580436/how-to-delete-matching-directories-recursively-using-windows-command
	@echo Remove %HOMEDRIVE%%HOMEPATH%\*.ffs_lock ffs_tmp
	cd %HOMEDRIVE%%HOMEPATH%
	FOR /D /r %%G in (*.ffs_tmp *.ffs_lock) do del /q /f /s "%%G"
	FOR /D /r %%G in (RecycleBin*.ffs_tmp) do rmdir /s /q "%%G"

	echo:
	@echo Remove ffs_lock and ffs_tmp
	for %%A in (E F G I) do (
		@echo %%A:
		%%A:
		cd %%A:\
		FOR /D /r %%G in (*.ffs_tmp *.ffs_lock) do del /q /f /s "%%G"
		FOR /D /r %%G in (RecycleBin*.ffs_tmp) do rmdir /s /q "%%G"
	)
	exit /b

