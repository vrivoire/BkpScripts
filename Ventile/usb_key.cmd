@echo off
chcp 65001
SETLOCAL ENABLEDELAYEDEXPANSION

echo:
@echo HOMEDRIVE   %HOMEDRIVE%
@echo HOMEPATH    %HOMEPATH%
@echo USERDOMAIN  %USERDOMAIN%
@echo USERNAME    %USERNAME%
@echo AppData     %AppData%
@echo IS_DEBUG    %IS_DEBUG%
echo:

title usb_key

for %%A in (D) do (
	@echo USB Key in %%A -------------------------------------------------------
	set USB_DRIVE=%%A:
	"C:\Program Files\FreeFileSync\FreeFileSync.exe" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\Ventile\usb_key-SyncSettings.ffs_batch"
	call :error	
	REM @echo ------
	REM dir /s /b "%USB_DRIVE%\*.ffs_tmp"
	REM del /s /q /f "%USB_DRIVE%\*.ffs_tmp"
	REM @echo ------	
)

if "%IS_DEBUG%"=="TRUE" pause

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