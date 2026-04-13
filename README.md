# Install

Make a nice place for it to live and clone it.
```git clone https://github.com/Treeefort/holedog-peer-monitoring.git```

Edit the config:
1. Set the URLs to monitor
2. Enter in your ntfy server
3. Enter in your ntfy topic

Add it to your crontab at whatever rate you wish it to run.
```crontab -e```
Then add a line at the bottom
```0 0-23 * * * /path/to/the/check.sh```
(This runs hourly)
