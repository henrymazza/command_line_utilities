#!/bin/sh

# Sync all data from Documents dir (except Virtual Machines) to MobileMe iDisk

/usr/local/bin//growlnotify "DocSync Daemon" -n "DocSync Daemon" -m "Iniciando sincronização…" --image /Users/HMz/bin/syncDocuments.png

export LOG=/Volumes/"Macintosh HD"/Users/HMz/bin/logs/idisk.log

echo `date` > $LOG
echo "Starting copy of Documents to iDisk..." >> $LOG

# iDisk Backup — it actually stinks
# rsync -a -E -4 -u --delete --copy-links --exclude=.* --exclude=.DS_Store --exclude=.TemporaryItems --exclude=.VolumeIcon.icns --exclude=tmp --exclude="Steam Content" --exclude="Virtual Machines" --exclude="Virtual Machines.localized" --exclude="iPhoto Library" --exclude="Microsoft User Data" --exclude="Parallels" --exclude="Dom Carlo Volume" --stats --progress /Volumes/"Macintosh HD"/Users/HMz/Documents/ /Volumes/iDisk/Documents/ >> $LOG
# rsync "/Volumes/dom carlo/DOM CARLO administração.xls" /Volumes/iDisk/Documents/"Dom Carlo"/  >> $LOG
# rsync -a -E -4 -u --delete --copy-links --exclude=.* --exclude=.DS_Store --exclude=.TemporaryItems --exclude=.VolumeIcon.icns "/Users/HMz/Arquivo/MyStuffs/" /Volumes/iDisk/Documents/"MyStuffs"/  >> $LOG
# rsync -a -E -4 -u --delete --copy-links --exclude=.* --exclude=.DS_Store --exclude=.TemporaryItems --exclude=.VolumeIcon.icns "/Users/HMz/Desktop/" /Volumes/iDisk/Documents/Desktop/  >> $LOG

# Dropbox Backup
rsync -a -E -4 -u --delete --copy-links --exclude=.* --exclude=.DS_Store --exclude=.TemporaryItems --exclude=.VolumeIcon.icns --exclude=tmp --exclude="Steam Content" --exclude="Virtual Machines" --exclude="Virtual Machines.localized" --exclude="iPhoto Library" --exclude="Microsoft User Data" --exclude="Parallels" --exclude="Dom Carlo Volume" --stats --progress /Volumes/"Macintosh HD"/Users/HMz/Documents/ /Users/HMz/Dropbox/Documents/ >> $LOG
rsync "/Volumes/dom carlo/DOM CARLO administração.xls" /Users/HMz/Dropbox/Documents/  >> $LOG
rsync -a -E -4 -u --delete --copy-links --exclude=.* --exclude=.DS_Store --exclude=.TemporaryItems --exclude=.VolumeIcon.icns "/Users/HMz/Arquivo/MyStuffs/" /Users/HMz/Dropbox/Documents/"MyStuffs"  >> $LOG
rsync -a -E -4 -u --delete --copy-links --exclude=.* --exclude=.DS_Store --exclude=.TemporaryItems --exclude=.VolumeIcon.icns "/Users/HMz/Desktop/" /Users/HMz/Dropbox/Desktop/  >> $LOG

echo "Backup of Documents to iDisk complete..." >> $LOG
echo "" >> $LOG
echo `date` >> $LOG
echo 'as user ' >> $LOG

/usr/local/bin//growlnotify "DocSync Daemon" -n "DocSync Daemon" -m "Sincronização efetivada com sucesso!" --image /Users/HMz/bin/syncDocuments.png

exit 0