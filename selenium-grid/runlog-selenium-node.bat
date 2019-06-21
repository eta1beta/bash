@echo off
set AMGHMS=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%-%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set LOGDIR=C:\work\logs\selenium-grid
set HOMEDIR=C:\work\workspace\eclipse\tecla-common-test\tecla-common-test-core-fvt
set LOGFILE=%LOGDIR%\node-%AMGHMS%.log

%HOMEDIR%\selenium-node.bat > %LOGFILE% 2>&1