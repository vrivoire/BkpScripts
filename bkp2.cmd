@echo off
echo ---------------- Executing %2 to drive %1 -----------------
set DEST_DRIVE=%1
"C:\Program Files\FreeFileSync\FreeFileSync.exe" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\%2.ffs_batch"
call :error
exit


:error
	if not %errorlevel% == 0 (
		echo DEST_DRIVE=%DEST_DRIVE%
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
	exit /b