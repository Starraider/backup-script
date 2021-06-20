#!/usr/bin/env bash

datum=$(date +%Y-%m-%d-%H-%M) 
backupPath="backup/"
userfilesPath="html/public/fileadmin/"
programPath="html/"
dbUser=
dbPassword=
dbServer=
dbName=




# Make backups of Database
echo "Backup DB..."

mysqldump --opt --compress -u'p12345' -p'passwort' -h'xyz.mydbserver.com' usr_p12345_1 > backup/"${datum}"_dbBackup.sql 
gzip ${datum}_dbBackup.sql 
echo "...done"

# Make backup of user/upload files
echo "Backup User-Files..."
tar -czf ${datum}_userFiles.tar.gz  ${userfilesPath}
echo "...done"

# Make backup of programm files
echo "Backup Program-Files..."
tar -czf ${datum}_programFiles.tar.gz  ${programPath}
echo "...done"

# Delete old backups
echo "Delete old backups..."
find ${backupPath}* -mtime +5 -exec rm {};
echo "...done" 
