@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

echo:
@echo Ventille les fichiers ect, bat, ffs_batch et les CVs
@echo HOMEDRIVE   %HOMEDRIVE%
@echo HOMEPATH    %HOMEPATH%
@echo USERDOMAIN  %USERDOMAIN%
@echo USERNAME    %USERNAME%
@echo AppData     %AppData%
echo:

echo:
@echo -------------------------------------------------------------------------
@echo PoidsPression
@echo -------------------------------------------------------------------------
start PoidsPression.cmd
@echo Fin PoidsPression ---------------------------------------------------------------

echo:
@echo -------------------------------------------------------------------------
@echo Nuage
@echo -------------------------------------------------------------------------
for %%G in ("GoogleDrive\Mon disque" OneDrive Mega Icedrive) DO (
	set TAG=%%~G
	@echo PoidsPression vers !TAG! == %%~G ---------------------------------------------------	
	"C:\Program Files\FreeFileSync\FreeFileSync.exe" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\Nuage-SyncSettings.ffs_batch"
	call :error
	
	del /s /q /f "C:\Users\ADELE\!TAG!\*.ffs_tmp"
	@echo ------
)
@echo Fin Nuage ---------------------------------------------------------------

echo:
@echo -------------------------------------------------------------------------
@echo Programs
@echo -------------------------------------------------------------------------
start "Programs" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\bkp2.cmd" A Programs
@echo Fin Programs -----------------------------------------------------------
echo:

@echo -------------------------------------------------------------------------
@echo Videos
@echo -------------------------------------------------------------------------
for %%A in (E F K) do start "bkp2 %%A" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\bkp2.cmd" %%A Videos
@echo Fin Videos --------------------------------------------------------------

echo:
@echo -------------------------------------------------------------------------
@echo Documents
@echo -------------------------------------------------------------------------
for %%A in (F K) do start "bkp2 %%A" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\bkp2.cmd" %%A Documents
@echo Fin Documents -----------------------------------------------------------

echo:
@echo -------------------------------------------------------------------------
@echo usb_key
@echo -------------------------------------------------------------------------
for %%A in (G:) do (
	@echo USB Key in %%A -------------------------------------------------------
	set USB_DRIVE=%%A
	"C:\Program Files\FreeFileSync\FreeFileSync.exe" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\usb_key-SyncSettings.ffs_batch"
	call :error	
	del /s /q /f "%USB_DRIVE%\*.ffs_tmp"
	@echo ------
)
@echo Fin usb_key -------------------------------------------------------------

echo:
@echo Fin ffs_batch -----------------------------------------------------------
echo:

@echo Ventille 3 - Done!
@echo %HOMEDRIVE%%HOMEPATH%\AppData\Roaming\FreeFileSync\Logs
rem pause
exit

:usb_key
	@echo USB Key in %1 -------------------------------------------------------
	set USB_DRIVE=%1
	"C:\Program Files\FreeFileSync\FreeFileSync.exe" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\usb_key-SyncSettings.ffs_batch"
	call :error
	exit /b


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

