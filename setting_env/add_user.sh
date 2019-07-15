#!/bin/bash

for i in $( cat users.txt ); do
    adduser --force-badname $i --gecos "$i,RoomNumber,WorkPhone,HomePhone" --disabled-password
    echo "$i:123456" | chpasswd
    setfacl -m user:$i:rw /var/run/docker.sock
    echo "echo $DISPLAY \nxhost + \nclear \ndocker exec -it -e DISPLAY $i bash" >>/home/$i/2sudoer.sh
    chmod -R 755 /home/$i/2sudoer.sh
    mkdir /home/$i/workdir
    cd /home/$i/workdir/
    echo "Wellcome $i to MOIL_Ubuntu system. Good Luck !!!!" >>readme.txt
    touch .sudo_as_admin_successful /home/$i/workdir
    cp /etc/skel/.bashrc /home/$i/workdir
    cp /etc/skel/.profile /home/$i/workdir
    echo 'echo -ne "\033]10;#430064\007"' >> /home/$i/workdir/.bashrc
    echo 'echo -ne "\033]11;#FFFFFF\007"' >> /home/$i/workdir/.bashrc
    mkdir /home/$i/workdir/Documents
    mkdir /home/$i/workdir/Downloads
    mkdir /home/$i/workdir/Data
    chmod 700 /home/$i
    chmod -R 777 /home/$i/workdir/
    chmod =r /home/$i/workdir/readme.txt
    echo "user $i created !!!"

done
