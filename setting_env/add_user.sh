#!/bin/bash

for i in $( cat user.txt ); do
    adduser --force-badname $i --gecos "$i,RoomNumber,WorkPhone,HomePhone" --disabled-password
    echo "$i:123456" | chpasswd
    setfacl -m user:$i:rw /var/run/docker.sock
    mkdir /home/$i/workdir
    cd /home/$i/workdir/
    echo "Wellcome $i to MOIL_Ubuntu system. Good Luck !!!!" >>readme.txt
    mkdir /home/$i/workdir/Documents
    mkdir /home/$i/workdir/Downloads
    mkdir /home/$i/workdir/Data
    chmod 700 /home/$i
    chmod -R 777 /home/$i/workdir/
    chmod =r /home/$i/workdir/readme.txt
    echo "echo $DISPLAY" >> /home/$i/.bashrc
    echo "xhost +" >> /home/$i/.bashrc
    echo "clear" >> /home/$i/.bashrc
    echo "docker exec -it -e DISPLAY $i bash" >> /home/$i/.bashrc
    echo "user $i created !!!"

done
