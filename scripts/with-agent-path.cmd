@echo off
setlocal EnableExtensions

call :prepend "C:\Windows\System32"
call :prepend "C:\Windows"
call :prepend "C:\PROGRA~1\Git\cmd"
call :prepend "C:\Python311"
call :prepend "%LOCALAPPDATA%\Programs\MiKTeX\miktex\bin\x64"

if "%~1"=="" (
  echo Usage: with-agent-path.cmd command [args...]
  exit /b 1
)

%*
exit /b %ERRORLEVEL%

:prepend
if not exist "%~1" exit /b 0
echo ;%PATH%; | C:\Windows\System32\find.exe /I ";%~1;" >nul
if errorlevel 1 set "PATH=%~1;%PATH%"
exit /b 0
