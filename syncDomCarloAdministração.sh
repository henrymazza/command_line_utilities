#!/bin/sh

exit 0

# Sync all data from Documents dir (except Virtual Machines) to MobileMe iDisk

export LOG=/Volumes/"Macintosh HD"/Users/HMz/Desktop/idisk.log

echo `date` > $LOG
echo "Starting copy of Documents to iDisk..." >> $LOG

mount smb://172.22.1.200/armando/armando/dom carlo /Users/

rsync -a -E -4 -u --copy-links --exclude=.* --exclude=.DS_Store --exclude=.TemporaryItems --exclude=.VolumeIcon.icns --exclude=tmp --exclude="Virtual Machines" --exclude="Virtual Machines.localized" --exclude="iPhoto Library" --exclude="Microsoft User Data" --exclude="Parallels" --exclude="Dom Carlo Volume" --stats --progress /Volumes/"Macintosh HD"/Users/HMz/Documents/ /Volumes/iDisk/Documents/ >> $LOG

echo "Backup of Documents to iDisk complete..." >> $LOG
echo "" >> $LOG
echo `date` >> $LOG

/usr/local/bin//growlnotify "DocSync Daemon" -n "DocSync Daemon" -m "Sincronização efetivada com sucesso!" --image /Users/HMz/bin/syncDocuments.png


exit 0