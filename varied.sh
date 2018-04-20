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
lftp -u teclatest,testtecla -p 226  -e "put ./sunglasshutBV.xml;quit" sftp://sftp.wedoit.io

# TEST exist file
if [ -e "${GENSTATS_DIR}/${targetEnv}/sghStatistics/sghStatistics_Files.zip" ]; then
    echo "File exists"
    
else 
	echo "File doesn't exist"
fi

#SEND MAIL WITH MAILX
echo "mail text." | mailx -s "object text ${targetEnv}" -a "file to send" "${EMAIL_STATISTICS} a@b.com b@c.com" 

# usage: ./emailer.sh $1 $2 $3 $4
EMAIL_OBJECT=$1 	# Ex: "Please find the AU Sales Report executed `date` attached to this email."
EMAIL_SUBJECT=$2 	# Ex: "AU Store Associate Sales Report"
EMAIL_ATTACH=$3 	# Ex: "./tmp/appo/file.zip"
EMAIL_TO=$4 		# Ex: "n.surname@b.com b.surname@c.com"
echo ${EMAIL_OBJECT}  | mailx -s ${EMAIL_SUBJECT} -a ${EMAIL_ATTACH} ${EMAIL_TO} 

## java command
${JAVA} -cp ./GenStatsOutbound.jar:/opt/ibm/db2/V10.5/java/db2java.zip:/opt/ibm/db2/V10.5/java/db2jcc.jar:/opt/ibm/db2/V10.5/java/db2jcc_license_cu.jar:. ${GENSTATS_ATTR} ${DBUSER1} ${DBPWD1} ${DBURLPARM} 


## compress thing with zip
zip -j /tmp/AU_Genstats_`date "+%m%d%y"`.zip /home/wasadmin/dataload/sgh/Outbound/GenStats/${targetEnv}/au/* `find ${IN_DIR}/AU/${targetEnv}/ ${IN_DIR}/AUINV/ -ctime -1 -type f`

## delete something inside zip
zip -d /tmp/AU_Genstats_`date "+%m%d%y"`.zip WCSDC*

