:: Batch Script Created by FreeBooter

@Echo Off & Cls

net sess>nul 2>&1||(powershell start cmd -ArgumentList """/c %~0""" -verb Runas & exit)

Call :IsAdmin

Mode CON LINES=5 COLS=50 & Color 0E

Echo                   PLEASE WAIT... 

:: This command deletes the oldest shadow copy on drive C
vssadmin delete shadows /for=c: /oldest 2>&1 >nul

::Creating System Restore point 
Wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Before Deleting Temp Files", 100, 12 


::    CLEANUP STAGE
Reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files"  /v LastAccess /t REG_DWORD /d "0" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Active Setup Temp Folders" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\BranchCache" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Downloaded Program Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Internet Cache Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Memory Dump Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Old ChkDsk Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Previous Installations" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Recycle Bin" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Service Pack Cleanup" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Setup Log Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\System error memory dump files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\System error minidump files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Setup Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Update Cleanup" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Upgrade Discarded Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\User file versions" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Defender" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Archive Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting Queue Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting System Archive Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Error Reporting System Queue Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows ESD installation files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul

Reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Windows Upgrade Log Files" /v "StateFlags0064" /t REG_DWORD /d "2" /f 2>&1 >nul



Cls & Mode CON  LINES=10 COLS=50 & Color 1E & Title Created by FREEBOOTER
Echo.
Echo.
Echo. 
Echo.
Echo.
Echo.
Echo.
Echo.
Echo.
Echo.
Echo.
Echo. 
Echo.
Echo.
Echo.
Echo           ษออออออออออออออออออออออออออป 
Echo           บ DELETING TEMPORARY FILES บ  
Echo           ศออออออออออออออออออออออออออผ
Echo.

CLEANMGR /sagerun:64 



Cls
:: Clear Temporary Folder.
Cd %TMP% 
For /f "tokens=*" %%a in ('Dir /b %LOCALAPPDATA%\Temp') do (
Echo Y | Rd /s /q "%%a" 2>NUL 1>NUL 
If Exist "%%a" Echo Y | Del /a /f "%%a" 2>NUL 1>NUL 
)
Echo. 
Echo.
Echo.
Echo.
Echo. 
Echo.
Echo.
Echo.
Echo. 
Echo.
Echo.
Echo.
Echo. 
Echo        FINNISH DELETING TEMPORARY FILES 
Echo.
Echo.
ping -n 5 localhost >Nul


Cls

Del /a /f /q "%SystemRoot%\Prefetch\*"















Cls & Mode CON  LINES=12 COLS=80 & Color 1E & Title Created by FREEBOOTER

Cd  %SystemRoot%\System32

Net Start TrustedInstaller 2>NUL 1>NUL

Reg QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 8" >Nul
If Not Errorlevel 1 (
Dism /Online /Cleanup-Image /StartComponentCleanup /ResetBase
) Else (
Reg QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 8.1" >Nul
If Not Errorlevel 1 (
Dism /Online /Cleanup-Image /StartComponentCleanup /ResetBase
) Else (
Reg QUERY "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName | find /i "Windows 10" >Nul
If Not Errorlevel 1 (
Dism /Online /Cleanup-Image /StartComponentCleanup /ResetBase
) Else (	
Goto :Event_Log
) ) )  

Ping -n 4 localhost >Nul

Goto :Event_Log




:IsAdmin
Reg query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
 Cls & Mode CON  LINES=5 COLS=48 & Color 0C & Title - WARNING -
 Echo.
 Echo. 
 Echo  YOU MUST HAVE ADMINISTRATOR RIGHTS TO CONTINUE 
 Pause >Nul & Exit
)
Cls
Goto :EOF



:Event_Log
Cls
Mode CON  LINES=33 COLS=85
For /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
Echo.
Echo                    Event Logs Have Been Cleared!
Ping -n 5 127.0.0.1 >Nul
Goto :eof
:do_clear
Echo clearing %1
wevtutil.exe cl %1
Goto :eof