@ECHO OFF
set AMG-HMS=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%-%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set LOGDIR=C:\work\logs\selenium-grid
set LOGFILE=logdelete.log

echo %AMG-HMS% >> %LOGDIR%\%LOGFILE%
ForFiles /p "%LOGDIR%" /s /d -6 /c "cmd /c del @file" >> %LOGDIR%\%LOGFILE% 2>&1