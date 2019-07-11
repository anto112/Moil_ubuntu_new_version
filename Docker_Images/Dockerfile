#Dockerfile for MOIL-Ubuntu

FROM ubuntu:18.04
MAINTAINER anto "m07158031@o365.mcut.edu.tw"
ENV DEBIAN_FRONTEND noninteractive

USER root
WORKDIR /root

# Use C.UTF-8 locale to avoid issues with ASCII encoding
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV locale-gen en_US.UTF-8
ENV dpkg-reconfigure locales

RUN yes | unminimize \
	&& apt-get update \
	&& apt-get install -qqy x11-apps \
	&& apt-get install -y --no-install-recommends \
		openssh-server \
		build-essential \
		gcc \
		libsqlite3-dev \
		sqlite3 \
		apt-utils \
		xdg-utils \
 		nano \
		git \
		make \
		sudo \
		tree \
		vim \
		unzip \
		curl \ 
		wget \
		gdb \
		g++ \
		software-properties-common \
		pkg-config \
  		python3-pip \
		python3-dev \
		dbus-x11 \
		x11-xserver-utils \
		net-tools \
		man-db \
		firefox \
		xorg \
		xterm \
		openbox \
		libcanberra-gtk-module \
		libcanberra-gtk3-module \
		python3-tk \
	&& apt-get autoremove -y \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	&& cd /usr/local/bin \
	&& ln -s /usr/bin/python3 python \
	&& pip3 install --upgrade pip \
	&& pip install --upgrade setuptools

# Create user "Student" with sudo powers
RUN useradd -m sudoer \
	&& usermod -aG sudo sudoer \
	&& echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers \
	&& sudo usermod -s /bin/bash sudoer \
	&& cp /root/.bashrc /home/sudoer/ \
	&& cp /root/.bashrc /etc/skel/ \
	#&& echo 'HOME=/home/sudoer/workdir' >> /etc/skel/.bashrc \
	&& touch /etc/skel/readme.txt \
	&& echo "You success make a new user, good job !!" >> /etc/skel/readme.txt \
	&& mkdir /home/sudoer/workdir \
	&& chown -R --from=root sudoer /home/sudoer

WORKDIR /home/sudoer/workdir
ENV HOME /home/sudoer
ENV USER sudoer
USER sudoer
ENV PATH $HOME/.local/bin:$PATH

# Avoid first use of sudo warning.
RUN touch $HOME/.sudo_as_admin_successful
COPY install.sh /tmp
RUN sudo chmod +x /tmp/install.sh
RUN sudo bash -c "/tmp/install.sh"

#change baground shell
RUN echo 'echo -ne "\033]10;#430064\007"' >> $HOME/.bashrc
RUN echo 'echo -ne "\033]11;#FFFFFF\007"' >> $HOME/.bashrc

#setting the home directory
RUN echo 'HOME=/home/sudoer/workdir' >> $HOME/.bashrc
RUN echo 'export NO_AT_BRIDGE=1' >> $HOME/.bashrc

CMD [ "/bin/bash" ]
