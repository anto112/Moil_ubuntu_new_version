#!/bin/bash
for i in $( cat users.txt ); do
    killall -u $i
    umount /home/$i/thinclient_drives
    deluser $i
    rm -rf /home/$i
    echo "user $i deleted !!!"
done
