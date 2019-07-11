# Install Xrdp Linux

1. Install xrdp in computer. in this method, running bash xrdp.sh like command bellow this.

   * **sh xrdp.sh**

2. open X11 folder and edit Xwraper.config. following this command.

   * **vi /etc/X11/Xwraper.config**

     after that change the service config

     original: *allowed_users=console* 

     change to : *allowed_users=anybody*

3. create and copy file .xsessionrc to *skel* folder 

   * **cp .xsessionrc /etc/skel/**

4. solve the authentication required to create managed color device problem by create file authentication.  follow the command:

   * **vi /etc/polkit-1/localauthority/50-local.d/45-allow.colord.pkla**

   and copy this :

   *[Allow Colord all Users]*

   *Identity=unix-user:* *

   *Action=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile*

   *ResultAny=no*

   *ResultInactice=no*

   *ResultActive=yes*

   or you can copy file I already make:

   * **cp 45-allow.colord.pkla /etc/polkit-1/localauthority/50-local.d/**

5. create new_user
   * **sudo adduser "new_user_name"**
   
   
#### Reference :

[1. www.azureunali.com](https://www.azureunali.com/linux-ubuntu-18-04-xrdp-remote-desktop-config-problem/)

[2. c-energy](http://c-nergy.be/blog/?p=13390)

