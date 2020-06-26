#!/bin/bash
# A menu driven shell script sample template 
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'
 

if ((EUID != 0)); then
    echo -e "${RED}Error... Root or Sudo  Required for script ( $(basename $0) ) ${STD}"
    exit
fi
# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

one(){
	echo "Connect.."
    protonvpn c
        pause
}
 
# do something in two()
two(){
	echo "Disconnect..."
    protonvpn d
        pause
}

three(){
	echo "Status..."
    protonvpn s
        pause
}

four(){
	echo "Fast..."
    protonvpn c -f
        pause
}
# function to display menus
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	cat menu.txt
	echo "~~~~~~~~~~~~~~~~~~~~~"
    echo "    "
	echo "1. Connet to VPN"
	echo "2. Disconnect to VPN"
    echo "3. Status VPN"
    echo "4. Fast VPN"
	echo "5. Exit"
}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.
read_options(){
	local choice
	read -p "Enter choice [ 1 - 5] : " choice
	case $choice in
		1) one ;;
		2) two ;;
        3) three ;;
        4) four ;;
		5) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
 
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
 
	show_menus
	read_options
done