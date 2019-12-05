echo
set COPYONDBX=c:\work\pneumatictube\PneumaticTube.exe
set DESTDIR=ARUBA03-BK

forfiles /p c:\copie\dump /s /m *.bak /c "cmd /c %COPYONDBX% -f @file -p %DESTDIR%"