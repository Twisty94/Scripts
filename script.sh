#!/bin/bash

echo "Hello, CREATED A USER!!"

select task in ADDUSER COPYUSER XENDEV 

do 
	case $task in 
	ADDUSER)
	read -p " Enter your username: " user
	echo " Specify the required group "
	awk -F: '{print $1;}' /etc/group | sort
	read -p " Enter the required additional group: " group
	useradd $user -m -G $group 
	mkdir -p /home/$user/.ssh/
	read -p " Specify the public RSA keys " keys
	echo "$keys" > /home/$user/.ssh/authorized_keys
	[[ $? == 0 ]] && echo " The User is created " && exit 0;;
	COPYUSER)
	echo " List of users "
	awk -F: '{ print $1 }' /etc/passwd | sort
	read -p " Enter a new username: " user
	read -p " Enter which username to copy " copyuser
	cp -r /home/$copyuser/* /home/$user/
	[[ $? == 0 ]] && echo " The content is copied " && exit 0;;
	XENDEV)
	read -p " Enter a new username: " user
	echo " server_name $user.dev.svyaznoy.ru;

        if ( $host = '$user.dev.svyaznoy.ru'){
                set $doc_root '/home/$user/sv-repo/www';
        } " >> /etc/nginx/vhost/sv_developers
	[[ $? == 0 ]] && echo " The completed " && exit 0;;
	esac
done
