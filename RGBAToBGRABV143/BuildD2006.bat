@echo off
set DCC="C:\Program Files\Borland\BDS\4.0\Bin\dcc32.exe"

%DCC% -b %1 %2 %3 %4 >nul:

if errorlevel 1 goto :Error

rem echo   OK
goto :End

:Error
echo   Failed ***

:End
