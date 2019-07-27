for i in $( cat users.txt ); do
	cp /home/lab217/Downloads/Midterm_Tes_Tuesday_7-23-2019.pdf /home/$i/Desktop
	chmod 766 /home/$i/Desktop/Midterm_Tes_Tuesday_7-23-2019.pdf
	#chown $i /home/$i/Desktop/Practice-1.pdf
	#chgrp $i /home/$i/Desktop/Practice-1.pdf
done
