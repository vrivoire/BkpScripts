set /P folder=Enter folder name: 
echo linking %folder%

xcopy "%HOMEDRIVE%%HOMEPATH%\Videos\%folder%\" "D:\Films\%folder%\" /s /e /y /F

rmdir "%HOMEDRIVE%%HOMEPATH%\Videos\%folder%" /s /q

junction64 -s "%HOMEDRIVE%%HOMEPATH%\Videos\%folder%" "D:\Films\%folder%"

rem pause