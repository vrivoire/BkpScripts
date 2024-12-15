@echo off
echo ---------------- Executing %1-SyncSettings.ffs_batch -----------------
"C:\Program Files\FreeFileSync\FreeFileSync.exe" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\%1-SyncSettings.ffs_batch"
call :error
REM for %%A in (E H) do (
	REM @echo %%A:
	REM %%A:
	REM cd %%A:\
	REM FOR /D /r %%G in (*.ffs_tmp *.ffs_lock) do del /q /f /s "%%G"
	REM FOR /D /r %%G in (*.ffs_tmp *.ffs_lock) do rmdir /s /q "%%G"
REM )

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
	rem goto :eof
	exit /b