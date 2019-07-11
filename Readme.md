# Docker Image allow user interface in Linux

This system is used for build a classroom system where a teacher can easily manage and collect data from students. why do we need use docker? when we use OS ubuntu in classroom environment, we cannot give student with sudo permission, because we cant control what students do. This method is not effective because the users without sudo permission are very limited in doing something. because this problem, we  use container for running operating system. container docker run using image where the image is read only. some advantages if we use container for teach student in classroom:

* we can give sudo permission to student
* image in docker is read only
* easy to manage the apps 
* can clone x11-Linux from parent OS to running user interface apps

### 1. Build images

To build image from dockerfile, go to inside folder where docker file  located and write the command line:

- docker build -t *name-images*:tag/version .

### 2. Adduser and Deluser

In classroom have so many student where the student must have same environment. so in this system, to add user you must have file user.txt where the content is the student list. after that run the bash script using comand bellow this. 

* sh add_user.sh

and this comand is for delete user.

* sh del_user.sh

### 3. Run container

Make sure when add new user you also share the run.sh from setting_env folder to home directory new user. so when you want to running container using new user account, just run bash script like command bellow this

*  sh run.sh

### 4. How its work

Picture bellow this is explain how the system work.



<img src="/Xrdp_setting/12.jpg">





Where the root user have ability to add user,delete user and permission to read,write and execute all file from all user. except root user, user cant see the content file of each other. so that it can prevent students from seeing or copying file from other students.

## Reference 

[1. Docker volume](https://docs.docker.com/storage/volumes/)

[2. Add multiple user](http://linuxsay.com/t/adding-multiple-users-in-ubuntu/3302)

[3. Use Docker without sudo](https://linoxide.com/linux-how-to/use-docker-without-sudo-ubuntu/)

[4. Setting Docker after instalation](https://docs.docker.com/install/linux/linux-postinstall/)









