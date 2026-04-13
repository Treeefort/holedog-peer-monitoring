# Hi
This is a simple tool to run on a cron job to check a web app and make sure it returns HTTP 200 - If not, it sends a notification to a ntfy server.

I made this with the intent on two or more self-hosters monitoring eachother's services externally, since your own server won't notify you if it's down (especially if you're hosting your own ntfy server)

# Install

Make a nice place for it to live and clone it.
```
git clone https://github.com/Treeefort/holedog-peer-monitoring.git
```

Edit the config:
1. Set the URLs to monitor
2. Enter in your ntfy server
3. Enter in your ntfy topic

Add it to your crontab at whatever rate you wish it to run.
```
crontab -e
```
Then add a line at the bottom
```
0 0-23 * * * /path/to/the/check.sh
```
(This example runs hourly)

