function seturl {
  URL="https://api.darksky.net/forecast/$APIKEY/$LONG,$LAT?exclude=alerts,flags,minutely&units=si"
}

function seturlparams {
  URLPARAMS=
}

function printResults {
  CURRENTLY=$(cat "$TMPDIR/tmp_$NAME.json" | grep "currently\",\"summary" | awk -F '"' '{print $6}')
  HOURLY=$(cat "$TMPDIR/tmp_$NAME.json" | grep "hourly\",\"summary" | awk -F '"' '{print $6}')
  DAILY=$(cat "$TMPDIR/tmp_$NAME.json" | grep "daily\",\"summary" | awk -F '"' '{print $6}')
  printf "%s\n%s\n%s" "$CURRENTLY" "$HOURLY" "$DAILY"
}
