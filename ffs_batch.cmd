@echo off
for %%A in (1 2 3) do call :bkp %%A
rem for %%A in (1 2) do call :bkp %%A
exit

:bkp
echo ---------------- Executing %1-SyncSettings.ffs_batch ------------------------
rem rd /s /q c:\$Recycle.Bin
rem rd /s /q F:\$Recycle.Bin
rem rd /s /q U:\$Recycle.Bin
"C:\Program Files\FreeFileSync\FreeFileSync.exe" "C:\Users\rivoi\Documents\%1-SyncSettings.ffs_batch"
if not %errorlevel% == 0 (
	::if return code is 1 or greater, something went wrong, add special treatment here
	echo Errors occurred during synchronization...
	echo %errorlevel%
	if %errorlevel% == 1 (
		echo Synchronization completed with warnings
	)
	if %errorlevel% == 2 (
		echo Synchronization completed with errors
	)	
	if %errorlevel% == 3 (
		echo Synchronization was aborted
	)	
	pause
)
exit /b