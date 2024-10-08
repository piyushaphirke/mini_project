#!/bin/bash
#check the user details

if [ "$(id -u)" -ne 0 ]; then
	echo "you must be root user"
	exit 1
fi

#Display Options

echo "1. Add user"
echo "2. Delete user"
echo "3. List user"
echo "4. Add group"
echo "5. Delete group"
echo "6. List group"
echo "7. Exit"

#Read user choice

read -p "Enter your choice:"  choice

#Perform task according to choice

case $choice in
	1)
		read -p "Add username: " username
	       useradd $username && echo "user created"
	       ;;
       2)
	       read -p "Delete username: " username
	       userdel -r  $username && echo "user deleted"
	       ;;
       3)      echo "Listing all users"
	      cut -d: -f1 /etc/passwd
	      ;;
	 4)
    read -p "Enter the group name to add: " groupname
    groupadd $groupname && echo "Group $groupname added."
    ;;
  5)
    read -p "Enter the group name to delete: " groupname
    groupdel $groupname && echo "Group $groupname deleted."
    ;;
  6)
    echo "Listing all groups:"
    cut -d: -f1 /etc/group
    ;;
  7)
    exit 0
    ;;
  *)
    echo "Invalid option. Please try again."
    ;;
esac      


	       
	          



