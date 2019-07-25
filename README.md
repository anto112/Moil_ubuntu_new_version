# Docker Image for classroom environment 

*By : **Haryanto** (member of OIL-Lab in Ming Chi University of Technology, Taiwan)*

---

<span style="color:red">Note:  This document is only for *Ubuntu system*</span>.

This system is used for build a classroom system where a teacher want to give the sudo permission for student without risk. bellow this is some [advantages of docker](https://www.quora.com/What-is-Docker-and-what-are-the-advantages):

* Teacher can give sudo permission to student for run the operating Linux system
* Image in docker is read only
* [Image docker](https://docs.docker.com/v17.09/engine/userguide/storagedriver/imagesandcontainers/#container-and-layers) can run more than 1 container. depend on requirement

<img src="/Picture/container.jpg" width="550" height="400" />

* Easy to manage the apps 

* Docker system can clone x11-Linux from host OS [to running user interface apps](https://medium.com/@SaravSun/running-gui-applications-inside-docker-containers-83d65c0db110). 

  <img src="/Picture/int.jpg" width="350" height="300" />

To setup the system, following the steep in bellow this.

#### 1. Install docker 

First time if you want to running apps using docker, you must [install docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/). open the **setting_env** folder and running command in **root** mode :

* sh install_docker.sh

when you get prompt in your terminal like picture bellow, that's mean installation of docker is success.

 <img src="/Picture/hello.jpg" width="750" height="350" />

#### 2. Give permission running docker without *sudo*

When you success install docker, setting the permission for [running docker without sudo](https://linoxide.com/linux-how-to/use-docker-without-sudo-ubuntu/). typing the command in the root user:

- setfacl -m user:*(name-user)*:rw /var/run/docker.sock 

<img src="/Picture/set.jpg"/>

or you also can use sudo user

- sudo setfacl -m user:*(name-user)*:rw /var/run/docker.sock 

<span style="color:red">Nb: name-user is user you use, remove the brackets</span>.

#### 3. Build images

To [build image from dockerfile](https://docs.docker.com/engine/reference/commandline/build/), go to inside folder where docker file  located and write the command line:

* docker build -t *name-images*:tag/version .

look like the example in bellow this:

<img src="/Picture/build2.jpg" />

<span style="color:red">note : oil = name-images, 1.3 = version. dont forget to typing dot (.) in the end of command</span>. 

to check your image is already made. typing the command

- docker images

The command will show all the images available in your computer. 

<img src="/Picture/imagee.jpg" />

#### 4. Run container 

When you want [running container](https://docs.docker.com/engine/reference/commandline/run/) from docker image we already build, you must following the syntax. example bellow this is the command run single container using same name with the user computer

- **docker run --privileged=true -it -d --net=host -e DISPLAY --volume /tmp/.x11-unix -v /home/$USER/workdir:/home/sudoer --name $USER oil:1.3 /bin/bash**

  explanation:

  - **-it** 	= connect the container to terminal 
  - **-net=Host**  = a container will share the host’s network stack and all interfaces from the host will be available to the container.
  - **-d**    = To start a container in detached mode
  - **--volume /tmp/.x11-unix** = access X11 server for running user interface APP.
  - **-v /home/$USER/workdir:/home/sudoer** = create volume and mounting in host computer. to save the file when work in docker. In here, docker will mount in workdir folder. you can change the mounting folder wherever you want.
  - **--name** $USER         =  to give the same name with the name user in host computer (you can change the name with name what you want)
  - **oil:1.3**         = that is the name and version of image docker we want to use.

when you write the command in terminal, it will like this: 

<img src="/Picture/66.jpg" />

after you execute the command above, make sure the container is running using command:

- docker ps 

<img src="/Picture/cont1.jpg" />

<span style="color:red">*because we use $USER, the name of container will same wit the user in local computer*</span>

after container created, create new bash process inside the container and connect it to terminal. if you want to running the user interface apps, you must export display  (-e DISPLAY) from the host os. follow the command step by step:

1. echo $DISPLAY
2. xhost +
3. docker exec -it -e DISPLAY (*name-container*) bash

<img src="/Picture/exec.jpg" />

When you get in docker system, it will change the terminal color, that is to distinguish with the terminal host. to make sure your docker environment can running user interface apps, you can typing **xclock**. it will show the picture like .

or you also can running the container directly connect to terminal. just remove the command **-d** and **-- name** . look like picture bellow this.

<img src="/Picture/drcnt.jpg" />

#### 5. mount the volume container to host

When you use a [bind mount](https://docs.docker.com/v17.09/engine/admin/volumes/bind-mounts/), a file or directory on the *host machine* is mounted into a container. also when you work in docker container, the file will stored in local host.  The system show in the picture bellow this.

<img src="/Picture/mount.png" width="350" height="200" />

#### 6. docker command usually will use

some [commands commonly used](https://www.docker.com/sites/default/files/Docker_CheatSheet_08.09.2016_0.pdf) to control containers, volumes and images on docker.

**View available Images **

* docker images

**View running container**

- docker ps 
- docker container ls

**View all container**

- docker ps -a

**View volume docker**

- docker volume ls

**Stop running container:**

- docker container stop $(docker ps -aq)

**Remove container not use:**

* docker container prune -f

**Remove all container :**

* docker container rm $(docker ps -aq)

**Remove volume not use:**

* docker volume prune -f

**Remove images docker not use:**

* docker image prune -f

**Remove image docker:**

* docker rmi (IMAGE ID) -f

<span style="color:red">Note: (-f) is for ignore the prompt</span>

#### 7. Reference 

​	[1. docker documentation](https://docs.docker.com/)

​	[2. Docker volume](https://docs.docker.com/storage/volumes/)

​	[3. Add multiple user](http://linuxsay.com/t/adding-multiple-users-in-ubuntu/3302)

​	[4. Use Docker without sudo](https://linoxide.com/linux-how-to/use-docker-without-sudo-ubuntu/)

​	[5. Setting Docker after instalation](https://docs.docker.com/install/linux/linux-postinstall/)
