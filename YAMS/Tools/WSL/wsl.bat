@echo off
REM YAMS (Yet Another Multiboot System)
REM wsl.bat

setlocal enableextensions enabledelayedexpansion
if "%~1" equ "start_spinner" goto :SPINNER

title YAMS's Windows Setup Loader
echo YAMS's Windows Setup Loader
echo.

REM Volume name to search for
set volume_name=YAMS

for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
	set loading_msg=Starting Wpeinit..
	set "exe=wpeinit"
	start "" %exe% 2>nul
	if not errorlevel 1 (
		set /a "spinner=0"
		set /a "spinner_cnt=0"
		call :SPINNER
		taskkill /IM "%exe%" >nul 2>&1
	)

for /f "tokens=1 delims=\ " %%a in ('mountvol^|find ":\"') do vol %%a 2>nul | find /i "%volume_name%" >nul 2>&1 && set letter=%%a
	if "%letter%"=="" (
		goto NOT_FOUND
	) else (
		echo OK - YAMS volume is %letter%
	)
)

for /f "tokens=1,2 delims==" %%b in (%letter%\YAMS\grub\grubenv) do (
	if %%b==iso_path set isopath=%%c
)

REM Inject ImDisk driver to WinPE and mount Windows ISO
rundll32.exe setupapi.dll,InstallHinfSection DefaultInstall 132 %letter%\YAMS\Tools\ImDisk\imdisk.inf
imdisk -a -f "%letter%\%isopath%" -m #:

for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
	set loading_msg=Starting Windows Setup..
	set "exe=X:\setup"
	start "" %exe% 2>nul
	if not errorlevel 1 (
		set /a "spinner=0"
		set /a "spinner_cnt=0"
		call :SPINNER
		taskkill /IM "%exe%" >nul 2>&1
		echo OK - Windows Setup has started
		goto EXIT
	)

:NOT_FOUND
echo ERROR: Cannot find YAMS volume
echo  - Did you rename the volume? If so, also change the name in the WSL file under "volume_name".
echo.
echo Info:
echo WSL location: [YAMS DRIVE]\YAMS\Tools\WSL\wsl.bat
echo WSL is currently searching for the volume name: %volume_name%

:EXIT
echo.
<nul set /p "=Press any key to close WSL.."
pause>nul
exit /b

:SPINNER
set /a "spinner=(spinner + 1) %% 4"
set "spinChars=\|/-"
<nul set /p "=%loading_msg% !spinChars:~%spinner%,1!!CR!"
ping -l 0 -n 1 -w 1000 127.0.0.1 >nul
set /a "spinner_cnt+=1"
if %spinner_cnt% lss 10 goto :SPINNER