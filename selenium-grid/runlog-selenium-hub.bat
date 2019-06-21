@echo off
set AMGHMS=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%-%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set LOGDIR=C:\work\logs\selenium-grid
set HOMEDIR=C:\work\workspace\eclipse\tecla-common-test\tecla-common-test-core-fvt
set LOGFILE=%LOGDIR%\hub-%AMGHMS%.log

%HOMEDIR%\selenium-hub.bat > %LOGFILE% 2>&1