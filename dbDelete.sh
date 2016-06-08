#!/bin/bash

DB_STARTS_WITH=$1

MHOST="host-server"
MUSER="ername"
MPWD="password"
MYSQL="mysql"

DBS="$($MYSQL -h $MHOST -u $MUSER -p"$MPWD" -Bse 'show databases')"
for db in $DBS; do

if [[ "$db" == $DB_STARTS_WITH* ]]; then
    echo "Deleting $db"
    $MYSQL -h $MHOST -u $MUSER -p"$MPWD" -Bse "drop database $db"
fi

done


