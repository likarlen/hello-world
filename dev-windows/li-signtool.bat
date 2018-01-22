@echo off

IF "%~1"=="" goto :MISSING_ARG

set PFX_FILE="C:\Users\jdaily\.digicert\lifeIMAGE.pfx"
set /p PFX_PW=<"C:\Users\jdaily\.digicert\cert_pw"

echo Code signing for %1 .....
signtool sign /d "lifeIMAGE Lite Agent" /f "%PFX_FILE%" /p "%PFX_PW%" %1

if errorlevel 1 goto :ERROR

echo Verifying %1 .....
signtool verify /pa %1

:DONE
exit /B 

:MISSING_ARG
echo [Usage]: %0 {File to codesign}
echo [Error]: Missing {File to codesign}
exit /B 1

:ERROR
echo Exit code %errorlevel%
exit /B 1
