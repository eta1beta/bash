REM #############################################
REM #### compress and save INETPUB folder #######
REM #### exclude pictures imecc           #######
REM #### compress and save IIS CONFIG     #######
REM #############################################
set dir7z=C:\Dropbox\ARUBA-BK
set w-zip="C:\Program Files\7-Zip\7z"

REM ##################### COMPRESS ########################
CD \BACKUP
del /Q *.7z
%w-zip% a -t7z -r -xr!iMecc\pictures\* INETPUB.7z C:\inetpub\WEDOPROD\*
%w-zip% a -t7z -r IIS.7Z C:\Windows\System32\inetsrv\config\*
REM ##################### MOVE ########################
move /y *.7z %dir7z%
