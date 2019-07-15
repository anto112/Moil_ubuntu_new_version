# Docker for running sudoer user

*By : **Haryanto** (member of OIL-Lab in Ming Chi University of Technology, Taiwan)*

=======================================================================================<span style="color:red">Nb:  This document is only for *Ubuntu system*</span>.

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

 <img src="/Picture/install_docker.jpg" width="550" height="380" />

#### 2. Give permission running docker without *sudo*

When you success install docker, setting the permission for [running docker without sudo](https://linoxide.com/linux-how-to/use-docker-without-sudo-ubuntu/). typing the command in the root user:

- setfacl -m user:*(name-user)*:rw /var/run/docker.sock 

<span style="color:red">Nb: name-user is user you use, remove the brackets</span>.<img src="/Xrdp_setting/set.jpg"/>

#### 3. Build images

To [build image from dockerfile](https://docs.docker.com/engine/reference/commandline/build/), go to inside folder where docker file  located and write the command line:

* docker build -t *name-images*:tag/version .

look like the example in bellow this:

<img src="/Picture/build.jpg" />

<span style="color:red">note : oil = name-images, 1.3 = version. dont forget to typing dot (.) in the end of command</span>.

#### 4. Run container

When you want [running container](https://docs.docker.com/engine/reference/commandline/run/) from docker image we already build, you must following the syntax. to make it easy, I write the bash script <span style="color:red">2sudoer.sh</span> in **setting_env** folder.  To execute the script, following this command in shell.

*  sh 2sudoer.sh

After execute the script, it will direct come to docker system to running Ubuntu OS.

#### 5. mount the volume container to host

When you use a [bind mount](https://docs.docker.com/v17.09/engine/admin/volumes/bind-mounts/), a file or directory on the *host machine* is mounted into a container. also when you work in docker container, the file will stored in local host.  The system show in the picture bellow this.

<img src="/Picture/mount.png" width="350" height="200" />

#### 6. Connect shell to container already exist

you can connect the terminal or shell with container already exist, following this command:

* docker exec -it -e DISPLAY (container-name) bash

<span style="color:red">Nb: if you want to running GUI Applications, don't forget to export display from the host OS (-e DISPLAY)</span> 

#### 7. stop and delete container, volume, image not use for keep the memory

some [commands commonly used](https://www.docker.com/sites/default/files/Docker_CheatSheet_08.09.2016_0.pdf) to control containers, volumes and images on docker.

**Stop running container:**

* docker container stop $(docker ps -aq)

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

<span style="color:red">Nb: (-f) is for ignore the prompt</span>

#### 8. Reference 

​	[1. docker documentation](https://docs.docker.com/)

​	[2. Docker volume](https://docs.docker.com/storage/volumes/)

​	[3. Add multiple user](http://linuxsay.com/t/adding-multiple-users-in-ubuntu/3302)

​	[4. Use Docker without sudo](https://linoxide.com/linux-how-to/use-docker-without-sudo-ubuntu/)

​	[5. Setting Docker after instalation](https://docs.docker.com/install/linux/linux-postinstall/)









