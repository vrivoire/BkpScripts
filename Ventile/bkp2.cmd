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

title bkp2 %1 %2

echo ---------------- Executing %2 to drive %1 -----------------
set DEST_DRIVE=%1
"C:\Program Files\FreeFileSync\FreeFileSync.exe" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\Ventile\%2.ffs_batch"
call :error

REM @echo ------
REM dir /s /b "%DEST_DRIVE%:\*.ffs_tmp"
REM del /s /q /f "%DEST_DRIVE%:\*.ffs_tmp"
REM @echo ------	
REM pause

if "%IS_DEBUG%"=="TRUE" pause

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