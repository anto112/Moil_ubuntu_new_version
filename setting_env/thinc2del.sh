for i in $( cat user.txt ); do
	umount /home/$i/thinclient_drives
	#rmdir /home/$i/thinclient_drives
done
