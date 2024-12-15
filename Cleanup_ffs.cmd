@echo.
@echo -------------------------------------------------------------------------
@echo Cleanup sync*.ffs_lock
@echo -------------------------------------------------------------------------
@echo off
rem https://superuser.com/questions/1580436/how-to-delete-matching-directories-recursively-using-windows-command
@echo Remove %HOMEDRIVE%%HOMEPATH%\*.ffs_lock ffs_tmp
cd %HOMEDRIVE%%HOMEPATH%
FOR /D /r %%G in (*.ffs_tmp *.ffs_lock) do del /q /f /s "%%G"
FOR /D /r %%G in (*.ffs_tmp *.ffs_lock) do rmdir /s /q "%%G"

@echo .
@echo Remove ffs_lock and ffs_tmp
for %%A in (D E F G H I K) do (
	%%A:
	cd %%A:\
	FOR /D /r %%G in (*.ffs_tmp *.ffs_lock) do del /q /f /s "%%G"
	FOR /D /r %%G in (*.ffs_tmp *.ffs_lock) do rmdir /s /q "%%G"
)