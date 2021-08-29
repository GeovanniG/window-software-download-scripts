@echo OFF

NET SESSION >nul 2>&1

IF %ERRORLEVEL% EQU 0 (
  echo. Installing packages
) ELSE (
  echo.
  echo ######## ########  ########   #######  ########
  echo ##       ##     ## ##     ## ##     ## ##     ##
  echo ##       ##     ## ##     ## ##     ## ##     ##
  echo ######   ########  ########  ##     ## ########
  echo ##       ##   ##   ##   ##   ##     ## ##   ##
  echo ##       ##    ##  ##    ##  ##     ## ##    ##
  echo ######## ##     ## ##     ##  #######  ##     ##
  echo.
  echo.
  echo ####### ERROR: ADMINISTRATOR PRIVILEGES REQUIRED #########
  echo This script must be run as administrator to work properly!
  echo.
  echo If you're seeing this after clicking on a start menu icon, then right click on the shortcut and select "Run As Administrator".
  echo ##########################################################
  echo.
  pause

  EXIT /B 1
)

@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
echo. Chocolatey is ready to begin installing packages!

@rem ---- [Place all chocolatey software you would like to install here] ----

@rem --- [e.g. choco install nodejs -y] ----

echo.
echo. Your installation is complete
echo.
pause
