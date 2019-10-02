cd

FORFILES /S /D -10 /C "cmd /c IF @isdir == TRUE rd /S /Q @path"


## --------------
## cicla in una dir e fa echo delle dir (R recurisvo)

for /R /D %s in (.\*) do @echo %s

## ----------------


for /R /D %s in (.\*) do

cd $s
FORFILES /S /D -10 /C "cmd /c IF @isdir == TRUE rd /S /Q $s

FORFILES /S /D -15 /C "cmd /c IF @isdir == TRUE rd /S /Q @path"

---------------------------
REM DEL OLDEST DIR IN DIR
cd \uranium\aruba
FOR /f "delims=" %%a in ('dir ".\*" /t:c /a:d /o:-d /b') do set lastfolder=%%a
echo %lastfolder%
rd /s /q ".\%lastfolder%"
-----------------------------

   

http://www.m-link.it/m-link_news/Script_batch_bat_per_eliminare_cancellare_file_piu_vecchi_di_un_certo_numero_di_giorni.asp
