REM TITLE: Annoying Mac

REM AUTHOR: jest

REM TARGET OS: MacOS

REM DESCRIPTION: An annoying payload that utilizes ducky/bash scripts to randomly turn on and off: wifi, capslock, numlock, press arrow keys, and teleports the mouse pointer around the screen.

---

The payload contains the following parts:
- annoying_mac.sh
- launchd_job.sh
- Duckyscript payload

The DuckyScript payload will `wget` the `annoying_mac.sh` and `launchd_job.sh` scripts hosted in the `Annoying_Mac` directory and executes them. 

The `annoying_mac.sh` script is responsible for toggling WiFi and mouse pointer movement. 

The `launchd_job.sh` script is responsible for scheduling a background job.

The other functionality is performed by the DuckyScript itself (toggling of capslock, enter, arrow keys).
