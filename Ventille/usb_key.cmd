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

title usb_key

for %%A in (G:) do (
	@echo USB Key in %%A -------------------------------------------------------
	set USB_DRIVE=%%A
	"C:\Program Files\FreeFileSync\FreeFileSync.exe" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\Ventille\usb_key-SyncSettings.ffs_batch"
	call :error	
	@echo ------
	dir /s /b "%USB_DRIVE%\*.ffs_tmp"
	del /s /q /f "%USB_DRIVE%\*.ffs_tmp"
	@echo ------	
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