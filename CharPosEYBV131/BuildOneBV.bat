@echo off
echo -------------------------------------------------------------------------------

set FILENAME=CharPosEYBV_D2005_%1.exe
echo Building %FILENAME% with D2005
call BuildD2005 CharPosEYBV %2 %3 %4
rename CharPosEYBV.exe %FILENAME%

set FILENAME=CharPosEYBV_D2006_%1.exe
echo Building %FILENAME% with D2006
call BuildD2006 CharPosEYBV %2 %3 %4
rename CharPosEYBV.exe %FILENAME%

set FILENAME=CharPosEYBV_D6_%1.exe
echo Building %FILENAME% with D6
call BuildD6 CharPosEYBV %2 %3 %4
rename CharPosEYBV.exe %FILENAME%

set FILENAME=CharPosEYBV_D7_%1.exe
echo Building %FILENAME% with D7
call BuildD7 CharPosEYBV %2 %3 %4
rename CharPosEYBV.exe %FILENAME%
