#!/bin/bash
sleep 20
/bin/python3 /home/pi/project/door.py &
/bin/python3 /home/pi/project/app_auto_opener.py &
exit
