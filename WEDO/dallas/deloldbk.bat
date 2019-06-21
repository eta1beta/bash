echo "----------------" >> C:\copie\deloldbk.log
date /T >> C:\copie\deloldbk.log

cls
d:
cd \uranium\ARUBA
FOR /f "delims=" %%a in ('dir ".\*" /t:c /a:d /o:-d /b') do set lastfolder=%%a
echo %lastfolder%
rd /s /q ".\%lastfolder%" >> C:\copie\deloldbk.log 2>&1

cd \uranium\dallas
FOR /f "delims=" %%a in ('dir ".\*" /t:c /a:d /o:-d /b') do set lastfolder=%%a
echo %lastfolder%
rd /s /q ".\%lastfolder%" >> C:\copie\deloldbk.log 2>&1

cd \uranium\nas01
FOR /f "delims=" %%a in ('dir ".\*" /t:c /a:d /o:-d /b') do set lastfolder=%%a
echo %lastfolder%
rd /s /q ".\%lastfolder%" >> C:\copie\deloldbk.log 2>&1

cd \uranium\tallin
FOR /f "delims=" %%a in ('dir ".\*" /t:c /a:d /o:-d /b') do set lastfolder=%%a
echo %lastfolder%
rd /s /q ".\%lastfolder%" >> C:\copie\deloldbk.log 2>&1