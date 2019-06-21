@ECHO OFF
REM ########################################################
REM ####  COMPRESS AND COPY BK TO DROPBOX SYNC IN WEDO #####
REM ########################################################
REM ########################### VAR ########################
set dirbk=c:\BACKUP\giornalieri
set dir7z=C:\Dropbox\ARUBA-BK
set dir-pic="C:\inetpub\WEDOPROD\iMecc\pictures"
set w-zip="C:\Program Files\7-Zip\7z"
set w-par=a -t7z
set bkuser=CRM_SFU
REM ##################### COMPRESS ########################
cd %dirbk%
del /Q *.7z
for %%a in (*.bak) DO (%w-zip% %w-par% %%a.7z %%a)
REM ##################### COMPRESS pictures ################
%w-zip% %w-par% -r pictures.7z %dir-pic%
REM ####################### MOVE 7Z TO DROPBOX ############
move /y *.7z %dir7z%
cd c:\backup