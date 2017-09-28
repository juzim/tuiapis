if [ -z "$1" ]; then
  SUBREDDIT="all"
else
  SUBREDDIT=$1
fi


if [ -z "$2" ]; then
  LIMIT=5
else
  LIMIT=$2
fi
BULLET="-"

function seturl {
  URL="https://www.reddit.com/r/$SUBREDDIT/top.json?limit=$LIMIT"
}

function seturlparams {
  URLPARAMS="--user-agent tuiapis"
}

function printResults {
  IFS=$'\n'
  for i in $(cat "$TMPDIR/tmp_$NAME.json" | grep "data\",\"title\""); do
    TITLE=$(echo "$i" | awk -F $"\t" '{print $2}' | sed 's/\\"/"/g')
    printf '%s %s\n' $BULLET $TITLE
  done
}
