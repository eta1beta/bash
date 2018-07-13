####################################################################
#!/bin/bash -x
# Modified by	TECLA
# Author		MDG
# Description	sghSiteCatalyst.sh
# caller		JenkinsFile step Outbound_Push_SiteCatalyst
####################################################################


# find pipe tar
find . -name discount_input.csv* -print -exec tar -cvf /tmp/discount_to_transfer.tar {} '+'

# order file recurse by date
find . -type f -printf "%-.22T+ %M %n %-8u %-8g %8s %Tx %.8TX %p\n" | sort | cut -f 2- -d ' '

# find file date
find . -type f -ls |grep 'Apr 16 10:'

#find file date without sh
find . ! -name '*.sh'  -type f -ls |grep 'Apr 16'|xargs ls -ltr

# compress file
tar -czvf name-of-archive.tar.gz /path/to/directory-or-file

# read content of tar gz file
tar tvf GENSTAT.tar.gz

# EXTRACT CONTENT
tar xvf GENSTAT.tar.gz

# test lftp in WEDO
### ATTENZIONE. se problemi provare in prima battuta a fare un ssh sull'host

lftp -u USER,PASSWORD -p 226  -e "put ./sunglasshutBV.xml;quit" sftp://sftp.wedoit.io


---------------------
# TEST exist file
if [ -e "${GENSTATS_DIR}/${targetEnv}/sghStatistics/sghStatistics_Files.zip" ]; then
    echo "File exists"
else
	echo "File doesn't exist"
fi
---------------------------------------

#SEND MAIL WITH MAILX
echo "mail text." | mailx -s "object text ${targetEnv}" -a "file to send" "${EMAIL_STATISTICS} a@b.com b@c.com"

# usage: ./emailer.sh $1 $2 $3 $4
EMAIL_OBJECT=$1 	# Ex: "Please find the AU Sales Report executed `date` attached to this email."
EMAIL_SUBJECT=$2 	# Ex: "AU Store Associate Sales Report"
EMAIL_ATTACH=$3 	# Ex: "./tmp/appo/file.zip"
EMAIL_TO=$4 		# Ex: "n.surname@b.com b.surname@c.com"
echo ${EMAIL_OBJECT}  | mailx -s ${EMAIL_SUBJECT} -a ${EMAIL_ATTACH} ${EMAIL_TO}

--------------------------------------

## java command
${JAVA} -cp ./GenStatsOutbound.jar:/opt/ibm/db2/V10.5/java/db2java.zip:/opt/ibm/db2/V10.5/java/db2jcc.jar:/opt/ibm/db2/V10.5/java/db2jcc_license_cu.jar:. ${GENSTATS_ATTR} ${DBUSER1} ${DBPWD1} ${DBURLPARM}

-------------------------------

## compress thing with zip
zip -j /tmp/AU_Genstats_`date "+%m%d%y"`.zip /home/wasadmin/dataload/sgh/Outbound/GenStats/${targetEnv}/au/* `find ${IN_DIR}/AU/${targetEnv}/ ${IN_DIR}/AUINV/ -ctime -1 -type f`
---------------------------------

## delete something inside zip
zip -d /tmp/AU_Genstats_`date "+%m%d%y"`.zip WCSDC*
-------------------------------------

sort -t"," -k1n,1 mergedfile.csv mergedfile_ordered.csv

sort -u mergedfile_ordered.csv -o mergedfile_dedup.csv

cat $(find ./ -name "file*" | sort -V) > newfile

-------------
## case
case "${storeInput}" in
	UK|ES|FR|DE)
		echo
		echo
	;;
	AU)
		echo
		echo
	;;
	*)
		echo "***ERROR: StoreInput ${storeInput} not recognized. Exiting..."
		exit 1
	;;
esac

------------------------------------------------------------------------------------------------
## read file with separator
file="./ipfile.txt"
while IFS=','  read -r  host ip
do
        echo  "il nome del server è $host e il suo ip è $ip"
done < $file

## ipfile.txt
server1,10.0.0.1
server2,10.0.0.2
server3,10.0.0.3

## output
il nome del server è server1 e il suo ip è 10.0.0.1
---------------------------------------------------------------------------

## header for new modified file

#!/bin/bash

# BEGIN METADATA
# Author = Stefano Teodorani / Romolo Archi / Raheeb Malliyil
# Issue = https://rayban.atlassian.net/browse/RB-26410
# Type = Email
# Name = ./Afterpay_canceled_orders.sh
# Recipients = Mutuated from parameter
# Source = https://bitbucket.org/luxrayban/rayban-infra-scripts
# END METADATA


script_dir="$(dirname "$0")"
script_name="$(basename $0)"
cfg_name="$(basename $sql_passed .sql).cfg"

source $script_dir/oracle.profile

trap ctrl_c INT

function ctrl_c() {
  echo "** Trapped CTRL-C"
  exit;
}

# -------
---------------------------------------


------------------------ aggiunte crontab jobs per ryaban prima originali
30 04-22 * * * /bin/bash /home/oracle/infradba/scripts/CheckZeroPrice_all_locale_prodlive.sh &> /home/oracle/infradba/logs/cronjob_logs/CheckZeroPrice_all_locale_prodlive-`date +\%Y\%m\%d\%H\%M\%S`.log
15 */1 * * * sh /home/oracle/infradba/scripts/CheckLowPrice_all_locale_prodlv.sh &>> /home/oracle/infradba/logs/cronjob_logs/CheckLowPrice_all_locale_prodlv.log
*/40 * * * * /bin/bash -x /home/oracle/infradba/scripts/CheckZeroPrice_all_locale_prodstg.sh &> /home/oracle/infradba/logs/cronjob_logs/CheckZeroPrice_all_locale_prodstg-`date +\%Y\%m\%d\%H\%M\%S`.log
05 */1 * * * sh /home/oracle/infradba/scripts/CheckLowPrice_all_locale_prodstg.sh &>> /home/oracle/infradba/logs/cronjob_logs/CheckLowPrice_all_locale_prodstg.log


40 04-22 * * * sh /home/oracle/infradba/scripts/Check_lz_Price_all_locale_psl.sh.work zero live &> /home/oracle/infradba/logs/cronjob_logs/CheckZeroPrice_all_locale_psl_zerolive_work-`date +\%Y\%m\%d\%H\%M\%S`.log
25 */1 * * * sh /home/oracle/infradba/scripts/Check_lz_Price_all_locale_psl.sh.work low live &>> /home/oracle/infradba/logs/cronjob_logs/CheckLowPrice_all_locale_psl_lowlive_work.log
*/50 * * * * sh /home/oracle/infradba/scripts/Check_lz_Price_all_locale_psl.sh.work zero stage &> /home/oracle/infradba/logs/cronjob_logs/CheckZeroPrice_all_locale_psl_zerostage_work-`date +\%Y\%m\%d\%H\%M\%S`.log
15 */1 * * * sh /home/oracle/infradba/scripts/Check_lz_Price_all_locale_psl.sh.work low stage &>> /home/oracle/infradba/logs/cronjob_logs/CheckLowPrice_all_locale_psl_lowstage_work.log
----------------------------------

