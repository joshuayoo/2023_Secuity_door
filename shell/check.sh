#! /bin/bash
emma_check=`ps -ef | grep -v "grep" | grep /home/pi/project/door.py  | wc -l`
date=$(date "+%Y-%m-%d_%H:%M:%S")
if [ "$emma_check" -eq '0'  ]; then
        /bin/python3 /home/pi/project/door.py >> ~/project/log/log.log&
        emma_check=`ps -ef | grep -v "grep" | grep /home/pi/project/door.py  | wc -l`
        if [ "$emma_check" -eq "0"  ]; then
                echo "$date Process Restart Failed!" >> ~/project/log/web_log.log
                /bin/sh /home/pi/project/shell/check.sh
        else
                echo "$date Process Restart Success!" >> ~/project/log/web_log.log
        fi
else
        echo "$date Process Alive" > ~/project/log/web_log.log
fi

# app_auto_opener
emma_check=`ps -ef | grep -v "grep" | grep /home/pi/project/app_auto_opener.py  | wc -l`
date=$(date "+%Y-%m-%d_%H:%M:%S")
if [ "$emma_check" -eq '0'  ]; then
        /bin/python3 /home/pi/project/app_auto_opener.py &
        emma_check=`ps -ef | grep -v "grep" | grep /home/pi/project/app_auto_opener.py  | wc -l`
        if [ "$emma_check" -eq "0"  ]; then
                echo "$date Process Restart Failed!" >> ~/project/log/web_log.log
                /bin/sh /home/pi/project/shell/check.sh
        else
                echo "$date Process Restart Success!" >> ~/project/log/web_log.log
        fi
else
        echo "$date Process Alive" > ~/project/log/web_log.log
fi
