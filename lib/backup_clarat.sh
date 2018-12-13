#!/bin/bash
/app/vendor/heroku-toolbelt/bin/heroku pg:backups capture --app hbg-local
export CURRENT_TIME=`date +"%Y-%m-%d-%H-%M-%S"`
export BACKUP_PUBLIC_URL=`/app/vendor/heroku-toolbelt/bin/heroku pg:backups public-url --app hbg-local`
curl -o /tmp/hbg-local-$CURRENT_TIME.dump $BACKUP_PUBLIC_URL
sftp -P 8022 -o "IdentityFile=/app/.ssh/id_rsa" hbglocal@$SFTP_IP:backups <<COMMAND
  put /tmp/hbg-local-$CURRENT_TIME.dump
  quit
COMMAND
