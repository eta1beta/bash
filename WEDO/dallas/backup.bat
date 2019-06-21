REM ########################### VAR ##########################
set dircp=c:\copie
set w-zip="C:\Program Files\7-Zip\7z"
set w-par=a -t7z
REM #### set dirzp=\\sandiego\c$\copie\dump_zip\miami
REM #### set dirdm=\\sandiego\c$\copie\dump\miami
set user=system/qelpds@DALLAS11_ORCL3
set dpdir=BACKUP
set bkuser=UNICATT_ROM_SINS_SRC,UNICAT_MIG,UNICATT_MIG,MAPPING
set exclude=EXCLUDE=INDEX/STATISTICS EXCLUDE=SCHEMA_EXPORT/TABLE/INDEX/STATISTICS EXCLUDE=STATISTICS EXCLUDE=TABLE/INDEX/STATISTICS 
rem REM ########################### PULIZIA##########################
cd %dircp%
del *.dmp
del *.log
del *.7z
rem REM ########################### DUMP ##########################
for %%u in (%bkuser%) do expdp %user% DIRECTORY=%dpdir% DUMPFILE=%%u.dmp SCHEMAS=%%u LOGFILE=%%u.log %exclude%
rem REM ########################### COMPRESS ########################
cd %dircp%
del /Q *.7z
for %%u in (%bkuser%) do %w-zip% %w-par% %%u %%u.*
REM ########################### COPIA ##########################
REM #### cd %dircp%
REM #### xcopy /Y *.7z  %dirzp%
REM #### xcopy /Y *.dmp %dirdm%
REM #### xcopy /Y *.log %dirdm%
del *.dmp
del *.log
move /y *.7z giornalieri