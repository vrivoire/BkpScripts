@echo off

@echo PoidsPression.cmd
FOR %%G IN ("GoogleDrive\Mon disque" OneDrive Mega Icedrive) DO (
	set TAG=%%~G
	@echo PoidsPression vers %TAG% . %%~G ---------------------------------------------------	
	"C:\Program Files\FreeFileSync\FreeFileSync.exe" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\PoidsPression-SyncSettings.ffs_batch"
	call :error
)
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