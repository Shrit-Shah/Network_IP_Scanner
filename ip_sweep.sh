#!/bin/bash

network=$(ifconfig $(nmcli device status | grep -e  [^dis]connected | cut -d " " -f 1) | grep inet[^6] | cut -d " " -f 10 | grep -E -o "([0-9]{1,3}[\.]){2}[0-9]{1,3}")

    for ip in $(seq 1 254); do
        ping -c 1 $network.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
    done
sleep 1
