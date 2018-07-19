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




@echo %s



d:

cd \uranium\nas01

date /T >> C:\copie\deloldbk.log

FORFILES /S /D -15 /C "cmd /c IF @isdir == TRUE rd /S /Q @path 1>> C:\copie\deloldbk.log 2>&1"

cd \uranium\dallas
FORFILES /S /D -15 /C "cmd /c IF @isdir == TRUE rd /S /Q @path 1>> C:\copie\deloldbk.log 2>&1"

cd \uranium\tallin
FORFILES /S /D -15 /C "cmd /c IF @isdir == TRUE rd /S /Q @path 1>> C:\copie\deloldbk.log 2>&1"

cd \uranium\odessa
FORFILES /S /D -15 /C "cmd /c IF @isdir == TRUE rd /S /Q @path 1>> C:\copie\deloldbk.log 2>&1"