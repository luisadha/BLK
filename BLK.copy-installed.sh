#!/bin/bash

#    BLK Mengeliminasi folder yang terdaftar di catatan hitam (BLK.blacklist.txt)

# Warning :
# Please be careful use at your own risk.

# Fitur : Tidak membutuhkan root.

# Manfaat : Folder jadi lebih rapi, tidak ada lagi folder yang menganggur

# Rekomendasi : Jika perangkat anda mendukung penonaktifan folder Standar Gunakan Skrip D2DF bersama dengan Skrip ini agar lebih membantu anda.

#Instalasi : Taruh berkas BLK.blacklist.txt dan BLK.sh di folder /sdcard

# Automisasi
# Di Terminal Emulator pada bagian Preferensi pilih Initial command
# Paste kan kode berikut:
#
#                                          cd /sdcard; clear; sh BLK.co*
#
# Jadi setiap anda ingin membersihkan badan Penyimpanan Internal masuk saja ke Terminal Emulator



readonly version="1.2"
readonly BASE_NAME=$(basename $0)
readonly NO_EXTENSION=$(echo $BASE_NAME | sed 's/\..*//')

# for which custom folder to delete check files BLK.blacklist.txt

echo
echo -e " [ $NO_EXTENSION v${version} ] "
echo
echo "[!] Silahkan periksa kembali folder yang penting, sebelum melanjutkan!."
echo
# echo "Beralih ke /sdcard";
 cd /sdcard;
echo "[?] Silahkan edit berkas BLK.blacklist.txt untuk folder yang disesuaikan."
echo
echo "Membaca..."
sleep 2
echo 

FILE='BLK.blacklist.txt'
FILE1='BLK.cache.txt'
FILE2='BLK.dell.sh'
FILE3='BLK2.log'


if [ -r /sdcard/download/$FILE ]; then
cat /sdcard/download/$FILE | xargs > $FILE1
else
echo $(pwd)
cat BLK.blacklist.txt | xargs > $FILE1;
fi

date "+date: %m/%d/%y%ttime: %H:%M:%S -> Make $FILE1 " >> BLK.log

cat $FILE1;
date "+date: %m/%d/%y%ttime: %H:%M:%S -> Read $FILE1 " >> BLK.log

echo
echo "[?] Apakah anda yakin tindakan ini akan menghapus folder yang terdaftar, file tidak dapat dipulihkan jika kamu melanjutkan!"
read REPLY

cat $FILE1 | sed 's/^/rm -rfv /' > $FILE2;
date "+date: %m/%d/%y%ttime: %H:%M:%S -> Make $FILE2 " >>  BLK.log

rm -f $FILE1;
 date "+date: %m/%d/%y%ttime: %H:%M:%S -> Delete $FILE1 " >> BLK.log
sleep 2

echo "Mengeksekusi... ";
echo

sh $FILE2 > BLK2.log;

# kondisi file kosong 

rm -f $FILE2;
date "+date: %m/%d/%y%ttime: %H:%M:%S -> Delete $FILE2 " >> BLK.log


if [ -s $FILE3 ]; then
cat ${FILE3}
date "+date: %m/%d/%y%ttime: %H:%M:%S -> Execute $FILE2 " >> BLK.log
date "+date: %m/%d/%y%ttime: %H:%M:%S -> Save logs " >> BLK.log
wait
echo 
echo "..Terbunuh"
else
echo "Tidak melakukan apapun! Anda mungkin sudah membersihkannya."
fi

rm  -f BLK.log # Hash this if you want debug

OUTFD='/sdcard/Download/dircontent_sdcard.txt'
sleep 2
echo
echo "Sedang memotret /sdcard"
echo
echo "Loading..."
sleep 2 
ls -ap --color | grep '/' > $OUTFD
echo	
echo -e "Selesai\n";
echo "[?] Ingin melihat hasilnya? [Y/n] "
read REPLY

case $REPLY
in
Y | y)
      printf "$(ls -d)$(pwd)$(echo ':')"
      echo 
       cat $OUTFD
       echo
       echo "[!] Mohon periksa hasilnya di direktori $OUTFD"
        echo
       exit 0;;
 N | n)
     clear
       exit 1;
esac
