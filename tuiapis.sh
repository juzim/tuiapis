#!/bin/bash

NAME=$1
shift

WORKDIR=$(pwd)
TMPDIR="$WORKDIR/tmp"
HELPERDIR="$WORKDIR/helper"
CONFIGDIR="$WORKDIR/config"
APIDIR="$WORKDIR/apis"

if [ ! -f $HELPERDIR/JSON.awk ]
then
  echo 'Please install JSON.awk. You can find more information is in the README file.'
fi

if [ -e $CONFIGDIR/config_$NAME.sh ]
then
  source $CONFIGDIR/config_$NAME.sh
fi

source $APIDIR/$NAME/script.sh

# set the URL in the corresponding script
seturl

seturlparams

# fetch data
curl -o $TMPDIR/tmp_$NAME.txt --silent $URLPARAMS $URL

# build json from tmp file
# JSON="$("$HELPERDIR/JSON.sh" -b < "$TMPDIR/tmp_$NAME.txt")"
JSON="$(echo -e $TMPDIR/tmp_$NAME.txt | awk -f $HELPERDIR/JSON.awk)"

printResults

rm "$TMPDIR/tmp_$NAME.txt"
