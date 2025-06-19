#!/bin/sh

prog=$1

chmod +x "$prog"

pid=$(ps -ef | grep -v grep | grep -i "./${prog}" | awk '{print $2}')

if [ -n "$pid" ] && [ "$pid" -gt 0 ]; then
    echo "$(date +"%F %T%Z"): ${prog} already running, killing it to start again"
    kill -9 $pid
    sleep 1
fi

./$prog -l log.txt
