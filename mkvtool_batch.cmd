@echo off
set EXE="C:\Program Files\MKVToolNix\mkvtoolnix-gui.exe"
@echo

rem for /l %%A in (2 1 30) do call :mkvtool %%A
for /l %%A in (1 1 1) do call :mkvtool %%A

:mkvtool
@echo %1
set PATH="C:\Users\rivoi\Videos\三体-Three-Body (2023) S01E0%1\三体-Three-Body (2023) EP-0%1"
rem set DISP=%EXE% -o mymovie.mkv mymovie.avi mymovie.srt
set DISP=%EXE% -o %PATH%.mkv %PATH%.mp4 %PATH%.srt

@echo %PATH%
@echo %DISP%
call %DISP%

rem "C:\Users\rivoi\Videos\??-Three-Body (2023) S01E0%1\??-Three-Body (2023) EP-0%1"

exit /b


pause