# nm-session-timer
A script as part of NickelMenu to track session time

add to Nickel config
```
menu_item   :main :Toggle Timer    :cmd_output :500  :exec /mnt/onboard/.adds/nm-session-timer/session_toggle.sh
```

or if you want to separate session start and stop:
```
menu_item   :main :Start Timer    :cmd_output :500  :exec /mnt/onboard/.adds/nm-session-timer/session_start.sh
```
![starting session](images/screen_001.png)

![ending session](images/screen_002.png)
