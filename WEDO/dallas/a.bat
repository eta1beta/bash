@ECHO OFF
CLS
:: =================== COPYRIGHT ========================================= 
:: File:          svn_backup.bat
:: Author:        Christopher C. Simmons (CCS)
:: Date:          05.01.2008
:: Purpose:       To make backups ("hot copies") of multiple SVN repos
:: History:       0.1 Initial Release
:: Assumes:       Your path contains: C:\Program Files\Subversion\bin
::                Your repodir contains only repos
:: Copyright:     2008 csimmons.net
::                
:: NOTICE!!!
:: csimmons.net, LLC supplies this software AS IS and makes no guarantees
:: for your use of it. csimmons.net, LLC is not responsible for any damage
:: or pain the use of this product may cause you.  Please give credit if 
:: you use this or create a derivative work.
:: =================== COPYRIGHT =========================================

:: =================== CONFIG ============================================
set AMG=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%
:: Path of the dir containing your repos [Note Trailing slash]
SET repodir=C:\Repositories
:: Path of the dir in which to create you hotcopies [Note Trailing slash]
SET repodirhot=D:\URANIUM\svn\%AMG%_Repositories_hotcopy
:: Path for log file [Note Trailing slash]
SET logdir=%repodirhot%
:: User mode - 1=Interactive | 0=NonInteractive
SET imode=1
:: =================== CONFIG ============================================

:: =================== SCRIPT ============================================
:: !!! NO NEED TO EDIT BEYOND THIS POINT !!!

mkdir %repodirhot%

net stop VisualSVNServer


REM ----  :: Make a date_time stamp like 030902_134200
REM ----  SET hh=%time:~0,2%
REM ----  
REM ----  :: Add a zero when this is run before 10 am.
REM ----  IF "%time:~0,1%"==" " set hh=0%hh:~1,1%
REM ----  SET yymmddyymmdd_hhmmss=%date:~12,2%%date:~4,2%%date:~7,2%_%hh%%time:~3,2%%time:~6,2%

:: Make a name for the log file
SET repolog=%logdir%\%AMG%_repobackup.log

:: Start log
ECHO START %date% %time% >> %repolog%

:: IF a  hotcopy exists delete it first ELSE
:: Create directories and svn hotcopy repos to them
FOR /F %%G IN ('dir /b /ad %repodir%') DO ^
IF EXIST %repodirhot%\%%G (rmdir /S /Q %repodirhot%\%%G & mkdir %repodirhot%\%%G >> %repolog% & ^
ECHO Starting SVN backup for %%G... >> %repolog% & ^
svnadmin hotcopy %repodir%%\%G %repodirhot%\%%G --clean-logs >> %repolog% & ^
IF %imode%== 1 ECHO FINISHED...%%G) ^
ELSE (mkdir %repodirhot%\%%G >> %repolog% & ^
ECHO Starting SVN backup for %%G... >> %repolog% & ^
svnadmin hotcopy %repodir%\%%G %repodirhot%\%%G --clean-logs >> %repolog% & ^
IF %imode%== 1 ECHO FINISHED...%%G)

:: Finish log
ECHO END %date% %time% >> %repolog%
:: Display log message if interactive mode otherwise EXIT
ECHO Done... Logs available here: %repolog% 
if %imode%== 1 net start VisualSVNServer
:: =================== SCRIPT ============================================


EXIT