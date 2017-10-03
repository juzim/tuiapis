#!/bin/bash
set -e

DEBUG="false"

for i in "$@"
do
case $i in
    --debug)
    DEBUG="true"
    shift
    ;;
    -c=*|--config=*)
    CONFIGDIR=`echo $i | sed 's/[-a-zA-Z0-9]*=//'`
    shift
    ;;
    *)
          # unknown option
    ;;
esac
done

if [ -z "$CONFIGDIR" ]
then
  CONFIGDIR="$(pwd)/config"
fi

echo $CONFIGDIR

if [ ! -d "$CONFIGDIR" ]; then
  printf '%s' "Config directory '$CONFIGDIR' does not exist"
  exit 0
fi

source "$CONFIGDIR/config.sh"

NAME=$1
shift

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

if [ $DEBUG == "true" ]; then
  VERBOSE="-vv"
else
  VERBOSE="--silent"
fi

# fetch data
curl -o $TMPDIR/tmp_$NAME.txt $VERBOSE $URLPARAMS "$URL"

if [ ! -f $TMPDIR/tmp_$NAME.txt ]
then
  echo 'Could not fetch result.'
  exit 0
fi

# build json from tmp file
echo -e $TMPDIR/tmp_$NAME.txt | awk -f $HELPERDIR/JSON.awk > $TMPDIR/tmp_$NAME.json

printResults

rm "$TMPDIR/tmp_$NAME.txt"
rm "$TMPDIR/tmp_$NAME.json"
