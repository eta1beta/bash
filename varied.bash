find . -name discount_input.csv* -print -exec tar -cvf /tmp/discount_to_transfer.tar {} '+'

# compress file
tar -czvf name-of-archive.tar.gz /path/to/directory-or-file

# read content of tar gz file
tar tvf GENSTAT.tar.gz

# order file recurse by date
find . -type f -printf "%-.22T+ %M %n %-8u %-8g %8s %Tx %.8TX %p\n" | sort | cut -f 2- -d ' '

# find file date
find . -type f -ls |grep 'Apr 16 10:'

#find file date without sh
find . ! -name '*.sh'  -type f -ls |grep 'Apr 16'|xargs ls -ltr