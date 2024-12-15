@echo off
@echo .
@echo Ventille les fichiers ect, bat, ffs_batch et les CVs
@echo HOMEDRIVE   %HOMEDRIVE%
@echo HOMEPATH    %HOMEPATH%
@echo USERDOMAIN  %USERDOMAIN%
@echo AppData     %AppData%
@echo .

call :Cleanup_ffs

@echo.
@echo -------------------------------------------------------------------------
@echo Nuage
@echo -------------------------------------------------------------------------
for %%A in (OneDrive Mega iCloudDrive Documents) do call :PoidsPression %%A
for %%A in (GoogleDrive OneDrive Mega iCloudDrive) do call :Nuage %%A
@echo Fin Nuage ---------------------------------------------------------------

@echo.
@echo -------------------------------------------------------------------------
@echo usb_key
@echo -------------------------------------------------------------------------
for %%A in (F:) do call :usb_key %%A
@echo Fin usb_key -------------------------------------------------------------

@echo.
@echo -------------------------------------------------------------------------
@echo Calling ffs_batch
@echo -------------------------------------------------------------------------
for %%A in (1 4) do call :bkp1 %%A
for %%A in (D I) do (
	@echo %%A:
	%%A:
	cd %%A:\
	FOR /D /r %%G in (*.ffs_tmp *.ffs_lock) do del /q /f /s "%%G"
	rem FOR /D /r %%G in (*.ffs_tmp *.ffs_lock) do rmdir /s /q "%%G"
)

for %%A in (2 3) do start "bkp2 %%A" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\bkp2.cmd" %%A

@echo.
@echo Fin ffs_batch -----------------------------------------------------------

rem call :Cleanup_ffs

@echo Ventille 3 - Done!
@echo %HOMEDRIVE%%HOMEPATH%\AppData\Roaming\FreeFileSync\Logs
pause
exit


:Nuage
	@echo Documents vers %1 ---------------------------------------------------	
	set TAG=%1

	"C:\Program Files\FreeFileSync\FreeFileSync.exe" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\Nuage-SyncSettings.ffs_batch"
	call :error
	exit /b

:PoidsPression
	@echo PoidsPression vers %1 ---------------------------------------------------	
	set TAG=%1
	"C:\Program Files\FreeFileSync\FreeFileSync.exe" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\PoidsPression-SyncSettings.ffs_batch"
	call :error
	exit /b

:usb_key
	@echo USB Key in %1 -------------------------------------------------------
	set USB_DRIVE=%1
	"C:\Program Files\FreeFileSync\FreeFileSync.exe" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\usb_key-SyncSettings.ffs_batch"
	call :error
	exit /b


:bkp1
	echo ---------------- Executing %1-SyncSettings.ffs_batch -----------------
	"C:\Program Files\FreeFileSync\FreeFileSync.exe" "%HOMEDRIVE%%HOMEPATH%\\Documents\BkpScripts\%1-SyncSettings.ffs_batch"
	call :error
	exit /b

REM :bkp2
REM 	echo ---------------- Executing %1-SyncSettings.ffs_batch -----------------
REM 	"C:\Program Files\FreeFileSync\FreeFileSync.exe" "%HOMEDRIVE%%HOMEPATH%\\Documents\BkpScripts\%1-SyncSettings.ffs_batch"
REM 	call :error
REM 	exit /b

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
	@echo.
	@echo -------------------------------------------------------------------------
	@echo Cleanup sync*.ffs_lock
	@echo -------------------------------------------------------------------------
	@echo off
	rem https://superuser.com/questions/1580436/how-to-delete-matching-directories-recursively-using-windows-command
	@echo Remove %HOMEDRIVE%%HOMEPATH%\*.ffs_lock ffs_tmp
	cd %HOMEDRIVE%%HOMEPATH%
	FOR /D /r %%G in (*.ffs_tmp *.ffs_lock) do del /q /f /s "%%G"
	rem FOR /D /r %%G in (*.ffs_tmp *.ffs_lock) do rmdir /s /q "%%G"

	@echo .
	@echo Remove ffs_lock and ffs_tmp
	for %%A in (D E F H I) do (
		@echo %%A:
		%%A:
		cd %%A:\
		FOR /D /r %%G in (*.ffs_tmp *.ffs_lock) do del /q /f /s "%%G"
		rem FOR /D /r %%G in (*.ffs_tmp *.ffs_lock) do rmdir /s /q "%%G"
	)
	exit /b

