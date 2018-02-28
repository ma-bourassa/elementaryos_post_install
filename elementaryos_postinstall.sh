#!/bin/bash
clear    
git_check () {
  	echo "Checking for git ..."
  	if command -v git > /dev/null; then
		echo "Git detected ..."
  	else
    	clear
  		echo "Git installation"
		echo ""
    	sudo apt update
		sudo apt install git -y
  	fi
}

gdebi_check()
{
    echo "Checking for gdebi..."
    if command -v gdebi > /dev/null; then
        echo "gdebi detected ..."
    else
        echo "Installing gdebi"
        sudo apt install gdebi -y
    fi
}  

notify-send  --icon=dialog-error "Warning!" "Root password will be ask" -t 10000
git_check
gdebi_check

# Zenity
GUI=$(zenity --list --checklist \
	--height 800 \
	--width 900 \
	--title="Script Post-Installation elementary OS 0.4.1 Loki" \
	--text "Pick one or multiple Actions to execute." \
	--column=Picks  \
	--column=Actions \
	--column=Description \
	TRUE "Update System" "Updates the package lists, the system packages and Applications."  \
	FALSE "Initial configuration" "Elementary OS ONLY! Disable single click and enable super as application hotkey" \
	FALSE "Delete default apps" "Elementary OS ONLY! Delete scratch, mail, calendar, epiphany browser and audience" \
	FALSE "Tweaks" "Elementary OS ONLY! Install Elementary Tweaks for additionnal options." \
	TRUE "Speed-Up Memory Action" "Install preload and zRAM." \
	TRUE "TLP" "Install TLP for better battery life." \
	TRUE "Build essential" "Install dpkg-dev, gcc, g++, libc and make." \
	TRUE "ArcOSX Theme" "Install ArcOSX theme." \
	TRUE "Ubuntu Restricted Extras" "Installs commonly used applications with restricted copyright (mp3, avi, mpeg, TrueType, Java, Flash, Codecs)." \
	TRUE "Bleachbit" "Install bleachbit for system cleanup." \
	TRUE "Open SSH" "Install Open SSH for remote connection." \
	TRUE "GParted" "Install GParted for system partition management." \
	TRUE "Oracle Java 9" "Install Oracle Java 9 JDK." \
	TRUE "Support for Archive Formats" "Installs support for archive formats." \
	TRUE "Chromium" "Installs Chromium. An open-source browser project that aims to build a safer, faster, and more stable way for all Internet users to experience the web." \
	TRUE "VLC" "Installs VLC. A free and open source cross-platform multimedia player and framework that plays most multimedia files as well as DVDs, Audio CDs, VCDs, and various streaming protocols." \
	TRUE "qbittorrent" "Install qbittorrent, BitTorrent client." \
	TRUE "Time Shift" "Install timeshift for system restoration." \
	TRUE "LibreOffice" "Installs LibreOffice. A powerful office suite." \
	TRUE "Gedit" "Install Gedit the text editor"
	TRUE "Vim" "Install Vim the text editor." \
	TRUE "Visual Studio Code" "Install Visual Studio Code the text editor." \
	TRUE "Boot Repair" "Install boot-repair for GRUB repairing." \
	TRUE "Conky-Manager" "Install Conky-manager to configure conky." \
	TRUE "Neofetch" "Install Neofetch to show system information on terminal." \
	TRUE "Gimp and GMIC" "Install GIMP and the extension GMIC." \
	TRUE "Dropbox" "Install dropbox, for cloud sharing." \
	TRUE "Spotify" "Install Spotify for music streaming." \
	TRUE "Steam" "Install Steam, online game platform." \
	TRUE "Skype" "Install Skype." \
    TRUE "Pushbullet" "Install Pushbullet." \
	TRUE "Gufw" "Install Gufw firewall." \
	TRUE "Fix Broken Packages" "Fixes the broken packages." \
	TRUE "Clean-Up Junk" "Removes unnecessary packages and the local repository of retrieved package files." \
	--separator=', ');
	
# Update System
if [[ $GUI == *"Update System"* ]]
then
	clear
	echo "Update System..."
	echo ""
	sudo apt -y update
	sudo apt -y upgrade
fi

# Initial config
if [[ $GUI == *"Initial configuratio"* ]]
then
	clear
	echo "Initial configuration..."
	echo ""
	gsettings set org.gnome.mutter overlay-key "'Super_L'"
	gsettings set org.pantheon.desktop.gala.behavior overlay-action "'wingpanel --toggle-indicator=app-launcher'"
	gsettings set org.pantheon.terminal.settings cursor-shape 'I-Beam'
	gsettings set org.pantheon.files.preferences single-click false
fi

# Delete default apps
if [[ $GUI == *"Delete default apps"* ]]
then
	clear
	echo "Delete default apps..."
	echo ""
	notify-send -i system-software-update "elementary OS Post Install" "Deleting default apps" -t 5000
	sudo apt purge pantheon-mail -y
	sudo apt purge maya-calendar -y
	sudo apt purge epiphany-browser epiphany-browser-data -y
	sudo apt purge audience -y
	sudo apt-get purge scratch-text-editor -y

fi

# Speed-Up Memory Action
if [[ $GUI == *"Speed-Up Memory Action"* ]]
then
	clear
	echo "Speed-Up Memory Action..."
	echo ""
	sudo apt -y install preload
	sudo apt -y install zram-config
fi

# Install TLP
if [[ $GUI == *"TLP"* ]]
then
	clear
	echo "TLP installation..."
	echo ""
	sudo add-apt-repository -y ppa:linrunner/tlp
	sudo apt -y update
	sudo apt -y install tlp tlp-rdw
	sudo tlp start
fi

# Build essential
if [[ $GUI == *"Build essential"* ]]
then
	clear
	echo "Build essential installation..."
	echo ""
	sudo apt update
	sudo apt install -y build-essential
fi

# Install elementary Tweaks
if [[ $GUI == *"Tweaks"* ]]
then
	clear
	echo "elementary Tweaks installation..."
	echo ""
	sudo add-apt-repository -y  ppa:philip.scott/elementary-tweaks
	sudo add-apt-repository -y ppa:noobslab/icons
	sudo add-apt-repository -y ppa:ricotz/docky
	sudo apt -y update
	sudo apt -y upgrade
	sudo apt -y install elementary-tweaks
	sudo apt-get -y install elementary-add-icons
	sudo apt install -y --reinstall plank
	killall plank
fi

# Install ArcOSX theme
if [[ $GUI == *"ArcOSX Theme"* ]]
then
	clear
	echo "ArcOSX theme installation..."
	echo ""
	sudo wget -O /tmp/osx-arc-collection_1.4.7_amd64.deb https://github.com/LinxGem33/OSX-Arc-Darker/releases/download/v1.4.7/osx-arc-collection_1.4.7_amd64.deb
	sudo gdebi --non-interactive /tmp/osx-arc-collection_1.4.7_amd64.deb
fi

# Bleachbit
if [[ $GUI == *"Bleachbit"* ]]
then
	clear
	echo "Bleachbit installation..."
	echo ""
	sudo apt install bleachbit -y
fi

# Open SSH
if [[ $GUI == *"Open SSH"* ]]
then
	clear
	echo "Open SSH installation..."
	echo ""
	sudo apt-get install -y openssh-client openssh-server
fi

# Install Ubuntu Restricted Extras
if [[ $GUI == *"Ubuntu Restricted Extras"* ]]
then
	clear
	echo "Ubuntu Restricted Extras installation..."
	echo ""
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
	sudo apt -y install ubuntu-restricted-extras ttf-mscorefonts-installer ubuntu-restricted-addons
fi

# Gparted
if [[ $GUI == *"GParted"* ]]
then
	clear
	echo "Gparted installation..."
	echo ""
	sudo apt install -y gparted
fi

#Oracle Java 9
if [[ $GUI == *"Oracle Java 9"* ]]
then
	clear
	echo "Oracle Java 9 installation..."
	echo ""
	sudo add-apt-repository ppa:webupd8team/java -y
	sudo apt update
	sudo apt install oracle-java9-installer -y
	sudo apt install oracle-java9-set-default -y
fi

# Support for Archive Formats
if [[ $GUI == *"Support formats d'archivage"* ]]
then
	clear
	echo "Support for Archive Formats installation"
	echo ""
	sudo apt -y install unace rar unrar p7zip-rar p7zip zip unzip sharutils uudeview mpack arj cabextract
fi

# Install Chromium
if [[ $GUI == *"Chromium"* ]]
then
	clear
	echo "Chromium installation..."
	echo ""
	sudo apt -y install chromium-browser
fi

# Install VLC
if [[ $GUI == *"VLC"* ]]
then
	clear
	echo "VLC installation..."
	echo ""
	sudo apt -y install vlc
fi

# Install qBittorent
if [[ $GUI == *"qbittorrent"* ]]
then
	clear
	echo "qbittorrent installation..."
	echo ""
	sudo apt -y install qbittorrent 
fi

# Install timeshift
if [[ $GUI == *"Time Shift"* ]]
then
	clear
	echo "Time Shift installation..."
	echo ""
	sudo add-apt-repository -y ppa:teejee2008/ppa
	sudo apt -y update
	sudo apt -y install timeshift
fi

# Install LibreOffice
if [[ $GUI == *"LibreOffice"* ]]
then
	clear
	echo "LibreOffice installation..."
	echo ""
	sudo add-apt-repository -y ppa:libreoffice/ppa
	sudo add-apt-repository -y ppa:shimmerproject/daily
	sudo apt -y update
	sudo apt -y install libreoffice libreoffice-style-elementary
fi

# Install Gedit
if [[ $GUI == *"Gedit"* ]]
then
	clear
	echo "Gedit installation..."
	echo ""
	sudo apt-get install -y gedit gedit-plugins
fi

# Install Vim
if [[ $GUI == *"Vim"* ]]
then
	clear
	echo "Vim installation..."
	echo ""
	sudo apt install vim -y
fi

# Install Visual Studio Code
if [[ $GUI == *"Visual Studio Code"* ]]
then
	clear
	echo "Visual Studio Code installation..."
	echo ""
	sudo wget -O /tmp/code.deb http://go.microsoft.com/fwlink/?LinkID=760868
	sudo gdebi --non-interactive /tmp/code.deb
fi

# Install boot-repair
if [[ $GUI == *"Boot Repair"* ]]
then
	clear
	echo "boot-repair installation..."
	echo ""
	sudo add-apt-repository -y ppa:yannubuntu/boot-repair
	sudo apt -y update
	sudo apt -y install boot-repair
fi

# Install conky-manager
if [[ $GUI == *"Conky-Manager"* ]]
then
	clear
	echo "conky-manager installation..."
	echo ""
	sudo add-apt-repository -y ppa:teejee2008/ppa
	sudo apt -y update
	sudo apt -y install conky-manager
fi

# Install neofetch
if [[ $GUI == *"Neofetch"* ]]
then
	clear
	echo "neofetch installation..."
	echo ""
	sudo add-apt-repository -y ppa:dawidd0811/neofetch
	sudo apt -y update
	sudo apt -y install neofetch
fi

# Install GIMP et GMIC
if [[ $GUI == *"Gimp and GMIC"* ]]
then
	clear
	echo "Gimp et gmic installation..."
	echo ""
    sudo add-apt-repository -y ppa:otto-kesselgulasch/gimp
    sudo apt -y update
    sudo apt -y install gmic gimp
fi

# Install Dropbox
if [[ $GUI == *"Dropbox"* ]]
then
	clear
	echo "Dropbox installation..."
	echo ""
	sudo git clone https://github.com/zant95/elementary-dropbox /tmp/elementary-dropbox
	bash /tmp/elementary-dropbox/install.sh
fi

# Install spotify
if [[ $GUI == *"Spotify"* ]]
then
	clear
	echo "Spotify installation..."
	echo ""
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt -y update
	sudo apt -y install spotify-client
fi

# Install steam
if [[ $GUI == *"Steam"* ]]
then
	clear
	echo "Steam installation..."
	echo ""
	sudo apt -y update
	sudo apt -y install steam
fi

# Install Skype
if [[ $GUI == *"Skype"* ]]
then
	clear
	echo "Skype installation..."
	echo ""
	sudo wget -O /tmp/skypeforlinux-64.deb https://go.skype.com/skypeforlinux-64.deb
	sudo gdebi --non-interactive /tmp/skypeforlinux-64.deb
fi

# Install Pushbullet
if [[ $GUI == *"Pushbullet"* ]]
then
	clear
	echo "Pushbullet installation..."
	echo ""
	sudo wget -O /tmp/pushbullet.deb https://github.com/sidneys/pb-for-desktop/releases/download/v6.8.1/pb-for-desktop-6.8.1-amd64.deb
	sudo gdebi --non-interactive /tmp/pushbullet.deb
fi

# Install Gufw
if [[ $GUI == *"Gufw"* ]]
then
	clear
	echo "Gufw installation..."
	echo ""
	sudo apt -y install gufw
fi

# Fix Broken Packages Action
if [[ $GUI == *"Réparer les paquets cassés"* ]]
then
	clear
	echo "Fixing broken packages..."
	echo ""
	sudo apt -y -f install
fi

# Clean-Up Junk
if [[ $GUI == *"Clean-Up Junk"* ]]
then
	clear
	echo "Clean-Up Junk..."
	echo ""
	sudo apt -y autoremove
	sudo apt -y autoclean
fi

# Notification
clear
notify-send -i dialog-ok "All the tasks are done!" -t 5000
