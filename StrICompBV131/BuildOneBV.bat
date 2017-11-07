@echo off
echo -------------------------------------------------------------------------------

set FILENAME=StrICompBV_D2005_%1.exe
echo Building %FILENAME% with D2005
call BuildD2005 StrICompBV %2 %3 %4
rename StrICompBV.exe %FILENAME%

set FILENAME=StrICompBV_D2006_%1.exe
echo Building %FILENAME% with D2006
call BuildD2006 StrICompBV %2 %3 %4
rename StrICompBV.exe %FILENAME%

set FILENAME=StrICompBV_D6_%1.exe
echo Building %FILENAME% with D6
call BuildD6 StrICompBV %2 %3 %4
rename StrICompBV.exe %FILENAME%

set FILENAME=StrICompBV_D7_%1.exe
echo Building %FILENAME% with D7
call BuildD7 StrICompBV %2 %3 %4
rename StrICompBV.exe %FILENAME%
