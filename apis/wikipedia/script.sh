LANG=$1
shift

QUERY=$*

function seturl {
  URL="https://$LANG.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro=&explaintext="
}

function seturlparams {
  URLPARAMS="--data-urlencode titles=$QUERY"
}

function printResults {
  EXCTRACT=$(cat "$TMPDIR/tmp_$NAME.json" | grep "\"extract\"]" | awk -F $"\t" '{print $2}' | sed 's/\\u[0-9]*//g' | sed 's/\\n/\n/g' | sed 's/\\"/"/g')
  printf '%s' "$EXCTRACT"
}
