SOURCE=$1

BULLET="-"

function seturl {
  URL="https://newsapi.org/v1/articles?source=$SOURCE&apiKey=$APIKEY"
}

function seturlparams {
  URLPARAMS=""
}

function printResults {
  IFS=$'\n'
  for i in $(cat "$TMPDIR/tmp_$NAME.json" | grep "\"title\"\]"); do
    TITLE=$(echo "$i" | awk -F $"\t" '{print $2}' | sed 's/\\"/"/g')
    printf '%s %s\n' $BULLET $TITLE
  done
}
