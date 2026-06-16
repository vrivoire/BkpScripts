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

title Documents

@echo -------------------------------------------------------------------------
@echo Documents
@echo -------------------------------------------------------------------------
for %%A in (F K) do start "bkp2 %%A" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\Ventile\bkp2.cmd" %%A Documents
@echo Fin Documents -----------------------------------------------------------

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