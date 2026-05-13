@echo off
cls
chcp 65001
SETLOCAL ENABLEDELAYEDEXPANSION

echo:
@echo HOMEDRIVE   %HOMEDRIVE%
@echo HOMEPATH    %HOMEPATH%
@echo USERDOMAIN  %USERDOMAIN%
@echo USERNAME    %USERNAME%
@echo AppData     %AppData%
echo:
echo:
@echo -------------------------------------------------------------------------
@echo Cleanup *.ffs_tmp
@echo -------------------------------------------------------------------------
echo:
for %%G in (C E F G I K) DO (
	set TAG=%%~G:
	@echo !TAG!
	!TAG!
	cd !TAG!\
	@echo dir
	dir /s /b !TAG!\*.ffs_tmp
	@echo del
	del /q /f /s !TAG!\*.ffs_tmp
	@echo rd
	for /d /r . %%d in (RecycleBin*.ffs_tmp) do rd /s /q "%%d"
	@echo -------------------------------------------------------------------------
)
pause
