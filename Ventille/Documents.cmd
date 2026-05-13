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

title Documents

@echo -------------------------------------------------------------------------
@echo Documents
@echo -------------------------------------------------------------------------
for %%A in (F K) do start "bkp2 %%A" "%HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\Ventille\bkp2.cmd" %%A Documents
@echo Fin Documents -----------------------------------------------------------
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