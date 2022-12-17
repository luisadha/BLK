#!/bin/bash
#    BLK deleting selected folders/files is listed in black notes. 
# Do it at your own risk
#  custom list folder to delete check the blacklistdir.txt file
# (c) 2022 luisadha 
#  versi 1.0
# 
echo "see Blacklistdir.txt for add folder to blacklist "
echo
echo "reading... from blacklistdir.txt "
sleep 2

cat blacklistdir.txt | xargs > BLK.cache.txt
cat BLK.cache.txt 
echo
echo "will be deleted, cannot restore if you procced"
read REPLY

cat BLK.cache.txt| sed 's/^/rm -rfv /' > BLK.dell.sh
rm -f BLK.cache.txt
sleep 2

echo "executing... script."
echo
sh BLK.dell.sh
wait 
echo "Executed"

rm -f BLK.dell.sh