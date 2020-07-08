#!/bin/bash

echo "Hello, CREATED A USER!!"

select task in ADDUSER COPYUSER 

do 
	case $task in 
	ADDUSER)
	read -p " Enter your username " user
	echo " Specify the required group "
	awk -F: '{print $1;}' /etc/group | sort
	read -p " Enter the required additional group: " group
	useradd $user -m -G $group 
	mkdir -p /home/$user/.ssh/5
	read -p " Specify the public RSA keys " keys
	echo "$keys" > /home/$user/.ssh/authorized_keys
	[[ $? == 0 ]] && echo " The User is created " && exit 0;;
	COPYUSER)
	echo " List of users "
	awk -F: '{ print $1 }' /etc/passwd | sort
	read -p " Enter a new username " user
	read -p " Enter which username to copy " copyuser
	cp -r /home/$copyuser/* /home/$user/
	[[ $? == 0 ]] && echo " The content is copied " && exit 0;;
	esac
done
