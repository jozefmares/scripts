#!/usr/bin/env bash

# variables
LOG="/var/log/spam-learn.log"

# redir output to log
exec >> $LOG 2>&1

# start learning
echo "$(date +%Y%m%d-%H:%M:%S) - spam learning script started"

# learn spam
for SpamDir in $(find /srv/vmail/vmail1/ -type d -name .Junk |grep -v indexes); do
  spam=$SpamDir/{cur,new}
  echo  "$(date +%Y%m%d-%H:%M:%S) - learning spam"
  /usr/bin/sa-learn --no-sync --spam $spam | while read line; do
    echo  "$line"
  done
done

# learn ham
for HamDir in $(find /srv/vmail/vmail1/ -type d -name Maildir |grep -v .Junk | grep -v .Trash | grep -v sieve | grep -v indexes); do
  ham=$HamDir/{cur,new}
  echo  "$(date +%Y%m%d-%H:%M:%S) - learning ham"
  /usr/bin/sa-learn --no-sync --ham $ham | while read line; do
    echo  "$line"
  done
done

# finish learning
echo "$(date +%Y%m%d-%H:%M:%S) - spam learning script finished"
echo "========================================================"
