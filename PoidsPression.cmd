@echo off

@echo PoidsPression.cmd
for %%A in (OneDrive Mega Icedrive Documents) do call :PoidsPression %%A

rem pause
exit

:PoidsPression
	@echo PoidsPression vers %1 ---------------------------------------------------	
	set TAG=%1
	"C:\Program Files\FreeFileSync\FreeFileSync.exe" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\PoidsPression-SyncSettings.ffs_batch"
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