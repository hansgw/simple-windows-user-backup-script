@echo off
setlocal enabledelayedexpansion

title %~n0
pushd "%~dp0"

:restart
for /f %%x in ('wmic os get localdatetime ^| findstr /b [0-9]') do set localdatetime=%%x
set source=%USERPROFILE%
set target=%~dp0Backup\%COMPUTERNAME%_%USERNAME%
set logdate=%localdatetime:~0,4%-%localdatetime:~4,2%-%localdatetime:~6,2%
set logdir=%~dp0Backup\Log
set logfile=%logdir%\%COMPUTERNAME%_%USERNAME%_%logdate%.txt

echo Welcome to swubs, the simple windows user backup script.
echo Let me help you back up your user directory
echo from this source: %source%\
echo   to this target: %target%\

:1_ask_for_target
set input=
set /p input="1/3 Is this the target directory where your backup should be saved? y/n "
if /i "%input%"=="y" goto 2_ask_for_replace
if /i "%input%"=="n" goto relocate
goto 1_ask_for_target

:2_ask_for_replace
set input=
if     exist "%target%" set /p input="2/3 Do you want to replace the last backup? y/n "
if not exist "%target%" set /p input="2/3 May the backup be replaced the next time you backup? y/n "
if /i "%input%"=="y" goto 3_ask_for_start
if /i "%input%"=="n" (
  set target=%target%_%logdate%
  echo New backup target: !target!\
  goto 3_ask_for_start
)
goto 2_ask_for_replace

:3_ask_for_start
set input=
set /p input="3/3 Start backup? y/n "
if /i "%input%"=="y" goto start_backup
if /i "%input%"=="n" goto restart
goto 3_ask_for_start

:start_backup
mkdir %logdir% 2>NUL
echo Creating backup...
echo. >> "%logfile%"
echo. >> "%logfile%"
echo %TIME% New backup started by https://github.com/hansgw/simple-windows-user-backup-script >> "%logfile%"
robocopy ^
  "%source%" ^
  "%target%" ^
  /mir ^
  /np ^
  /r:0 ^
  /tee ^
  /unilog+:"%logfile%" ^
  /w:0 ^
  /xa:sh ^
  /xd "%APPDATA%" ^
  /xd "%TEMP%" ^
  /xf NTUSER.DAT* ^
  /xf *.lock ^
  /xjd

if %ERRORLEVEL% equ 0 goto success
if %ERRORLEVEL% equ 1 goto success

:error
popd
echo Sorry, your backup failed.
echo Call someone for help.
echo Help your helper by sending this file: %logfile%
pause
goto :EOF

:relocate
popd
echo Place the script "%~n0" where you want your backup to reside and start it from there.
pause
goto :EOF

:success
popd
echo Your backup is complete.
echo Mark the next backup date in your calendar.
pause
goto :EOF
