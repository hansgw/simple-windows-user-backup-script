@echo off

title %~n0

pushd "%~dp0"

mkdir Backup\Log 2>NUL

robocopy ^
  %USERPROFILE% ^
  Backup\%USERNAME% ^
  /MIR ^
  /UNILOG+:Backup\Log\%DATE%_%~n0.log ^
  /R:0 ^
  /W:0 ^
  /TEE ^
  /XA:SH ^
  /XD Anwendungsdaten ^
  /XD AppData ^
  /XD tmp ^
  /XD TEMP ^
  /XF NTUSER.DAT ^
  /XF ntuser.dat.LOG1 ^
  /XF ntuser.dat.LOG2 ^
  /XF *.lock ^
  /XJD

popd

echo Das Backup ist fertig.
echo Du solltest dir jetzt den naechsten Backup-Termin in deinem Kalender notieren!

pause
