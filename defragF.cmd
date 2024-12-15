@echo off

FOR %%A IN ($MFT $LogFile $Volume $AttrDef $Bitmap $Boot $BadClus $Secure $UpCase $Extend) DO CALL :CONTIG %%A

echo -------------------- F:\Vincent\*.* ----------------------
call contig64 -nobanner -q -s F:\Vincent\*.*

exit

:CONTIG
echo -------------------- %1 ----------------------
call contig64 -nobanner -q -s C:\%1
@echo .
exit /B

:END
rem pause