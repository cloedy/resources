#!/bin/bash
DB=$1
TABLE=$2

usage() {
  echo $(basename $0) dbname table
  exit 2
}
if [ -z $DB ];then
    usage
    exit 1;
fi
if [ -z $TABLE ];then
    usage
    exit 1;
fi
#  -c, --complete-insert    Use complete insert statements.
#  -e, --extended-insert
#      Use multiple-row INSERT syntax that include several VALUES lists
# -t, --no-create-info
#                      Don't write table creation info.
# -d, --no-data       No row information.

mysqldump -c -t -e \
--lock-tables=FALSE \
--dump-date=FALSE \
--skip-add-locks \
$DB $TABLE > $DB.$TABLE.sql
