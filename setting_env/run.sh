#!/bin/bash

docker container stop $(docker ps -aq)
docker container rm $(docker ps -aq)
docker volume prune -f

for i in $( cat users.txt); do
	docker run --privileged=true -it -d --net=host -e DISPLAY --volume /tmp/.x11-unix -v /home/$i/workdir:/home/sudoer/workdir --name $i oil:1.3 /bin/bash
echo "container $i created"

done
