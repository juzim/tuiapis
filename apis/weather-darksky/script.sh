function seturl {
  URL="https://api.darksky.net/forecast/$APIKEY/$LONG,$LAT?exclude=alerts,flags,minutely&units=si"
}

function seturlparams {
  URLPARAMS=
}

function printResults {
  CURRENTLY=$(echo "$JSON" | grep "currently\",\"summary" | awk -F '"' '{print $6}')
  HOURLY=$(echo "$JSON" | grep "hourly\",\"summary" | awk -F '"' '{print $6}')
  DAILY=$(echo "$JSON" | grep "daily\",\"summary" | awk -F '"' '{print $6}')
  printf "%s\n%s\n%s" "$CURRENTLY" "$HOURLY" "$DAILY"
}
