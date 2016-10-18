#! /bin/bash

# Author: Prometheus
# Last Date Updated: 08/05/2015 00:09
#
# This program should remove most useless programs
# from Linux Mint Cinnamon.
# However this program is not perfect it does miss some
# programs sometimes.

#Begin Setup program dependent functions
Remover() {
	#Remove useless programs the OS may have
	sudo apt-get remove -y chess
	sudo apt-get remove -y frozen-bubble
	sudo apt-get remove -y gltron
	sudo apt-get remove -y kbreakout
	sudo apt-get remove -y kdiamond
	sudo apt-get remove -y kmahjongg
	sudo apt-get remove -y kmines
	sudo apt-get remove -y kpatience
	sudo apt-get remove -y ksnake
	sudo apt-get remove -y ksnakeduel
	sudo apt-get remove -y skanlite
	sudo apt-get remove -y kontact
	sudo apt-get remove -y kwalletmanager
	sudo apt-get remove -y klipper
	sudo apt-get remove -y knotes
	sudo -get remove -y cheese
	sudo apt-get remove -y gwenview
	sudo apt-get remove -y karbon
	sudo apt-get remove -y krita
	sudo apt-get remove -y pidgin
	sudo apt-get remove -y skype
	sudo apt-get remove -y thunderbird
	sudo apt-get remove -y atraci
	sudo apt-get remove -y marble
	sudo apt-get remove -y gmusicbrowser
	sudo apt-get remove -y handbrake
	sudo apt-get remove -y kdenlive
	sudo apt-get remove -y banshee
	sudo apt-get remove -y hexchat
	sudo apt-get remove -y empathy
	#This has been removed from the purge list until
	#I can perfect the chrome install.
	#apt-get remove -y firefox
}

Installer() {
		#Update repository
		sudo apt-add-repository -y ppa:webupd8team/java
		sudo apt-add-repository -y ppa:danielrichter2007/grub-customizer

		#add repositories before program continues
		sudo apt-get update

		#Update OS first
		sudo sudo apt-get -y upgrade
		sudo apt-get -y dist-upgrade

		#Fix any broken dependencies
		sudo apt-get -f -y install

		#Add some programs
		sudo apt-get install -y steam
		sudo apt-get install -y grub-customizer
		sudo apt-get install -y wine
		sudo apt-get install -y clementine
		sudo apt-get install -y gparted
		sudo apt-get install -y virtualbox
		sudo apt-get install -y encfs
		sudo apt-get install -y htop
		sudo apt-get install -y gufw
		sudo apt-get install -y remmina
		sudo apt-get install -y sshfs
		sudo apt-get install -y filezilla
		sudo apt-get install -y oracle-java8-installer
		sudo apt-get install -y grub-customizer

		#Fix dependencies before downloading and installing chrome
		sudo apt-get -f install

		#Some issues have prevented me from rolling this feature out
		#Get google chrome 32bit
		#wget "https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb"
		#dpkg -i google-chrome-stable_current_i386.deb
		#rm google-chrome-stable_current_i386.deb

		#Double check updates n shit
		sudo apt-get -y update
		sudo apt-get -y upgrade
		sudo apt-get -y dist-upgrade

		#House cleaning
		sudo apt-get -y autoremove
}

minecraft() {
	#Get minecraft & put on Desktop
	sudo wget "https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar"
	sudo mv Minecraft.jar ~/Desktop
}

echoCache() {
	#Fucking figure it out bro
	clear
	echo ""
	echo "All programs to be removed listed below"
	echo "All K programs are removed also, "
	echo "*****************************************"
	echo "* banshee hexchat firefox pidgin        *"
	echo "* skype thunderbird chess frozen-bubble *"
	echo "* gltron                                *"
	echo "*****************************************"
	echo ""
	echo "All programs added are listed below"
	echo "******************************************"
	echo "* steam grub-customizer wine clementine  *"
	echo "* gparted virtualbox encfs htop          *"
	echo "* gufw remmina sshfs filezilla           *"
	echo "* oracle-java8-installer grub-customizer *"
	echo "******************************************"
  echo ""
	echo "Press any button to return to the main menu."

	read back
	case $back in
		*) clear;
			 Menu;
			 Main;;
	esac
}

countDown() {
	echo "The program will begin in...."
	echo ".....3....."
	sleep 1
	echo ".....2....."
	sleep 1
	echo ".....1....."
	sleep 1
	echo ".....Go....."
}

Menu() {
	#Menu options
	echo "*************************************************************************"
	echo "** You have three options below                                        **"
	echo "** Option 1: Remove selected programs and install my program selection **"
	echo "** Option 2: Simply install all apt-get programs                       **"
	echo "** Option 3: Option 1 and add minecraft to desktop                     **"
	echo "** Option 4: View a list of all programs to be added and removed       **"
	echo "** Option 5: View ReadMe                                               **"
	echo "*************************************************************************"
	echo "Your option: "
	read usrInput
}

Main() {
	case $usrInput in
		1) echo "You chose option 1";
			 echo "The following will be installed and removed"
			 countDown;
			 Remover;
			 Installer;;

		2) echo "you chose option 3";
			 countDown;
			 Installer;;

		3) echo "You chose option 2";
			 countDown;
			 Remover;
			 Installer;
			 minecraft;;

		4) echoCache;;

		5) readMe;;

		*) clear;
			 echo -e "\e[1;31m Sorry did not understand your input! \e[0m";
			 echo -e "\e[1;31m Please enter a number and press [ENTER] \e[0m";
			 echo "";
			 Menu;
			 Main;;
	esac
}

readMe() {
	#Basic Read Me
	clear
	echo ""
	echo "This whole program is an experiment to teach myself."
	echo "This program most likely can not break anything. "
	echo -e "\e[1;31m ******************IMPORTANT**************** \e[0m"
	echo -e "\e[1;31m UNLESS YOU NEED A PROGRAM THIS ONE REMOVES. \e[0m"
	echo "If that is possible please view the list of programs"
	echo "The largest issue is with the chrome browser."
	echo "I believe the issue is if you run the chrome installer and currently"
	echo "have chrome installed. I will look into this further later"
	echo "Sometimes there are dependency issues, this will be fixed (hopefully)"
	echo "that are handled, this is in the main menu (option 4)."
	echo "Or press '1' then [ENTER] to view the list."
	echo ""
	echo "To return to the main menu press any button then hit [ENTER]"

	#Returns user to main menu
	read back
	case $back in

		1) echoCache;
			 Menu;
			 Main;;

		*) clear;
			 Menu;
			 Main;;
	esac
}

Setup() {
	clear
	Menu
	Main
}
#End of setup program dependent functions

clear
echo -e "*************************\e[1;31m THE PROMETHEUS PROGRAM \e[0m*****************************"
echo "****     What would you like to do?                                      *****"
echo "****     Option 1: Run setup program                                     *****"
echo "******************************************************************************"
echo "User Option: "
read options
case $options in
	1) Setup;;
	2) Connect;;
	*) clear;
		 echo -e "\e[1;31m Sorry did not understand your input! \e[0m";
		 echo -e "\e[1;31m Please enter a number and press [ENTER] \e[0m";
		 echo "";
		 Menu;
		 Main;;
esac
