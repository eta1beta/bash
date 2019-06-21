REM ######### TEST RUNNING DROPBOX PROCESS ################
tasklist /FI "IMAGENAME eq dropbox.exe" 2>NUL | find /I /N "dropbox.exe">NUL
if "%ERRORLEVEL%"=="0" ( 
	echo %date% %time% Programm is running >> dropbox.log
	exit
) ELSE (
	echo %date% %time% Programm is not running >> dropbox.log
	cd "C:\Program Files (x86)\Dropbox\Client"
	start dropbox.exe -B
)
exit
REM ########################################################
