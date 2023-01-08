#!/bin/bash
#    BLK deletes all blacklisted folders/files. Please be careful use at your own risk.

readonly version="1.1"
readonly BASE_NAME=$(basename $0)
readonly NO_EXTENSION=$(echo $BASE_NAME | sed 's/\..*//')

# for which custom folder to delete check files BLK.blacklist.txt
echo $NO_EXTENSION


echo "please double-check important files before proceeding!"
echo
 echo " switch ke /sdcard"
cd /sdcard

echo "see BLK.blacklist.txt for add folder to blacklist "
echo
echo "reading... from blacklistdir.txt "
sleep 2
echo 

FILE='BLK.blacklist.txt'
FILE1='BLK.cache.txt'
FILE2='BLK.dell.sh'

cat BLK.blacklist.txt | xargs > $FILE1;
date "+date: %m/%d/%y%ttime: %H:%M:%S -> Make $FILE1 " >> BLK.log

cat $FILE1;
date "+date: %m/%d/%y%ttime: %H:%M:%S -> Read $FILE1 " >> BLK.log

echo
echo "will be deleted, cannot restore if you procced"
read REPLY

cat $FILE1 | sed 's/^/rm -rfv /' > $FILE2;
date "+date: %m/%d/%y%ttime: %H:%M:%S -> Make $FILE2 " >>  BLK.log

rm -f $FILE1;
 date "+date: %m/%d/%y%ttime: %H:%M:%S -> Delete $FILE1 " >> BLK.log
sleep 2

echo "executing... script."
echo

sh $FILE2 > BLK2.log;

# kondisi file kosong 

cat BLK2.log
date "+date: %m/%d/%y%ttime: %H:%M:%S -> Execute $FILE2 " >> BLK.log

date "+date: %m/%d/%y%ttime: %H:%M:%S -> Save logs " >> BLK.log
wait
echo 
echo "Executed"

rm -f $FILE2;
date "+date: %m/%d/%y%ttime: %H:%M:%S -> Delete $FILE2 " >> BLK.log

