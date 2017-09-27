#!/bin/bash

NAME=$1
shift

WORKDIR=$(pwd)
TMPDIR=$WORKDIR/tmp
HELPERDIR="$WORKDIR/helper"
CONFIGDIR="$WORKDIR/config"
APIDIR="$WORKDIR/apis"

if [ -e $CONFIGDIR/config_$NAME.sh ]
then
  echo 'Please install JSON.sh. You can find more information is in the README file.'
fi

if [ -e $CONFIGDIR/config_$NAME.sh ]
then
  source $CONFIGDIR/config_$NAME.sh
fi

source $APIDIR/$NAME/script.sh

# set the URL in the corresponding script
seturl

if [ `type -t seturlparams`"" == 'function' ]
then
  seturlparams
else
  URLPARAMS=
fi

# fetch data
curl -o $TMPDIR/tmp_$NAME.txt --silent $URLPARAMS $URL

# build json from tmp file
JSON="$("$HELPERDIR/JSON.sh" -b < "$TMPDIR/tmp_$NAME.txt")"

printResults

rm "$TMPDIR/tmp_$NAME.txt"
