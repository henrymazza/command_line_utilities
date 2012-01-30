#!/bin/sh

# Sync all data from Documents dir (except Virtual Machines) to MobileMe iDisk

/usr/local/bin//growlnotify "DocSync Daemon" -n "DocSync Daemon" -m "Iniciando sincronização…" --image /Users/HMz/bin/syncDocuments.png

LOG=/Volumes/System/Users/HMz/bin/logs/idisk.log

echo `date` > $LOG
echo "Starting copy of Documents to iDisk..." >> $LOG

# rsync "/Volumes/dom carlo/DOM CARLO administração.xls" /Users/HMz/Dropbox/Documents/  >> $LOG
rsync -a -E -4 -u --delete --copy-links --exclude=.* --exclude=.DS_Store --exclude=.TemporaryItems --exclude=.VolumeIcon.icns "/Users/HMz/Arquivo/MyStuffs/" /Users/HMz/Dropbox/Documents/"MyStuffs"  >> $LOG
rsync -a -E -4 -u --delete --copy-links --exclude=.* --exclude=.DS_Store --exclude=.TemporaryItems --exclude=.VolumeIcon.icns "/Users/HMz/Desktop/" /Users/HMz/Dropbox/Desktop/  >> $LOG

echo "Backup of Documents to iDisk complete..." >> $LOG
echo "" >> $LOG
echo `date` >> $LOG
echo 'as user ' >> $LOG

/usr/local/bin//growlnotify "DocSync Daemon" -n "DocSync Daemon" -m "Sincronização efetivada com sucesso!" --image /Users/HMz/bin/syncDocuments.png

exit 0
