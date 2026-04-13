
CONFIG="./config"

if [ -f "$CONFIG" ]; then
  source "$CONFIG"
  echo -e "\e[32mConfig loaded!\e[0m"
  echo -e "[\e[1;4mntfy server:\e[0m $NTFY_SERVER/$NTFY_TOPIC]"
else
  echo -e "\e[31mMissing config file!\e[0m"
  exit 1
fi

for site in "${MONITOR_URLS[@]}"; do
  status=$(curl -Is -o /dev/null -w "%{http_code}" "$site" | head -n 1)
  checktime=$(date)
  #echo "$status:$site"
if [ $status -eq 200 ]; then
    echo -e "\e[1;32mUP: $site\e[0m"
else
    echo -e "\e[1;31mDOWN: $site\e[0m"
curl -Is -o /dev/null \
    -H "Title: Resource Unreachable" \
    -H "Tags: no_entry_sign,globe_with_meridians" \
    -d "DOWN: $site
    Checked at: $checktime
    HTTP code: $status" \
    "$NTFY_SERVER/$NTFY_TOPIC"
  fi
done
