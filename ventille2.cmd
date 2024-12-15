@echo off
@echo .
@echo Ventille les fichiers ect, bat, ffs_batch et les CVs
@echo HOMEDRIVE   %HOMEDRIVE%
@echo HOMEPATH    %HOMEPATH%
@echo USERDOMAIN  %USERDOMAIN%
@echo .

rem call cleanup.cmd
rem for %%A in (GOOGLE~1 OneDrive BOXSYN~1 Box VOTREQ~1\VINCEN~1 VINCEN~1\VINCEN~1) do call :doc %%A

@echo -------------------------------------------------------
@echo Documents
@echo -------------------------------------------------------
for %%A in (GOOGLE~1 OneDrive Box Dropbox) do call :doc %%A
@echo Fin documents -------------------------------------------------------------------------------------
rem pause 

@echo.
@echo -------------------------------------------------------
@echo usb_key
@echo -------------------------------------------------------
for %%A in (I: F:) do call :usb_key %%A	
@echo Fin usb_key -------------------------------------------------------------------------------------
rem pause


@echo.
@echo -------------------------------------------------------
@echo Calling ffs_batch
@echo -------------------------------------------------------
for %%A in (1 2 3 4) do call :bkp %%A
@echo Fin ffs_batch -------------------------------------------------------------------------------------


@echo Ventille 2 - Done!
pause
exit

rem --------------------------------------------------------------------------------------------------------------------------
:bkp
echo ---------------- Executing %1-SyncSettings.ffs_batch ------------------------
"C:\Program Files\FreeFileSync\FreeFileSync.exe" "C:\Users\rivoi\Documents\BkpScripts\%1-SyncSettings.ffs_batch"
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

:doc
@echo Documents vers %1 -------------------------------------------------------------------------------------
rmdir %HOMEDRIVE%%HOMEPATH%\%1\%USERDOMAIN% /s /q

mkdir %HOMEDRIVE%%HOMEPATH%\%1\%USERDOMAIN%
copy /Y %HOMEDRIVE%%HOMEPATH%\Documents\*.* %HOMEDRIVE%%HOMEPATH%\%1\%USERDOMAIN%

mkdir %HOMEDRIVE%%HOMEPATH%\%1\%USERDOMAIN%\zip
xcopy %HOMEDRIVE%%HOMEPATH%\Documents\zip\*.* %HOMEDRIVE%%HOMEPATH%\%1\%USERDOMAIN%\zip\  /y /f /j /b
xcopy %HOMEDRIVE%%HOMEPATH%\Documents\Jobs\*.* %HOMEDRIVE%%HOMEPATH%\%1\%USERDOMAIN%\Jobs\ /s /e /y /f /j /b
xcopy %HOMEDRIVE%%HOMEPATH%\Documents\Factures\*.* %HOMEDRIVE%%HOMEPATH%\%1\%USERDOMAIN%\Factures\ /s /e /y /f /j /b
xcopy %HOMEDRIVE%%HOMEPATH%\Documents\CV_Vincent\*.* %HOMEDRIVE%%HOMEPATH%\%1\%USERDOMAIN%\CV_Vincent\ /s /e /y /f /j /b
xcopy %HOMEDRIVE%%HOMEPATH%\Documents\Scotia\*.* %HOMEDRIVE%%HOMEPATH%\%1\%USERDOMAIN%\Scotia\ /s /e /y /f /j /b
xcopy %HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts\*.* %HOMEDRIVE%%HOMEPATH%\%1\%USERDOMAIN%\BkpScripts\ /s /e /y /f /j /b
xcopy %HOMEDRIVE%%HOMEPATH%\AppData\Local\Packages\Microsoft.FlightSimulator_8wekyb3d8bbwe\LocalState\*.* %HOMEDRIVE%%HOMEPATH%\%1\MSFS2020\ /s /e /y /f /j /b
@echo .
exit /b

:usb_key
@echo USB Key in %1 -------------------------------------------------------------------------------------
set USB_DRIVE=%1
rmdir %USB_DRIVE%\%USERDOMAIN% /s /q
mkdir %USB_DRIVE%\%USERDOMAIN%\
copy /Y %HOMEDRIVE%%HOMEPATH%\Documents\*.* %USB_DRIVE%\%USERDOMAIN%

xcopy %HOMEDRIVE%%HOMEPATH%\Documents\zip %USB_DRIVE%\%USERDOMAIN%\zip\  /s /e /y /f /j 
xcopy %HOMEDRIVE%%HOMEPATH%\Documents\Jobs %USB_DRIVE%\%USERDOMAIN%\Jobs\ /s /e /y /f /j
xcopy %HOMEDRIVE%%HOMEPATH%\Documents\Factures %USB_DRIVE%\%USERDOMAIN%\Factures\ /s /e /y /f /j
xcopy %HOMEDRIVE%%HOMEPATH%\Documents\CV_Vincent %USB_DRIVE%\%USERDOMAIN%\CV_Vincent\ /s /e /y /f /j
xcopy %HOMEDRIVE%%HOMEPATH%\Documents\Scotia %USB_DRIVE%\%USERDOMAIN%\Scotia\ /s /e /y /f /j
xcopy %HOMEDRIVE%%HOMEPATH%\Documents\BkpScripts %USB_DRIVE%\%USERDOMAIN%\BkpScripts\ /s /e /y /f /j
xcopy %HOMEDRIVE%%HOMEPATH%\AppData\Local\Packages\Microsoft.FlightSimulator_8wekyb3d8bbwe\LocalState\*.* %USB_DRIVE%\MSFS2020\ /s /e /y /f /j
@echo .
exit /b
