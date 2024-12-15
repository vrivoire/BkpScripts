set /P folder=Enter folder name: 
echo de-linking %folder%

rmdir "%HOMEDRIVE%%HOMEPATH%\Videos\%folder%" /s /q

rmdir "D:\Films\%folder%" /s /q

rem pause