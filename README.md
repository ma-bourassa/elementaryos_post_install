# Elementaryos_postinstall

This script provide a GUI to install third party softwares on Elementary OS Loki.
The script will automatically install Git and Gdebi unless they are already installed.

![Screenshot](elementaryOS_zenity.png)

# Author

Marc-André Bourassa

# How to run
First, copy this line in a terminal :
```
sudo apt -y install software-properties-common python-software-properties software-properties-common -y

```
and this one to download and run the script :
```
wget -O /tmp/elementaryos_postinstall.sh https://raw.githubusercontent.com/bouhrassa/elementaryos_postinstall/master/elementaryos_postinstall.sh && chmod +x /tmp/elementaryos_postinstall.sh && /tmp/elementaryos_postinstall.sh

```
To enable open folder as root : 
```
sudo touch /usr/share/contractor/folder-openasroot.contract && gksudo gedit /usr/share/contractor/folder-openasroot.contract
```
When the file opens, paste below context and close the file (It’ll be saved automatically).
```
[Contractor Entry]
Name=Open folder as root
Icon=pantheon-files
Description=Open current folder as root privilege
MimeType=inode;
Exec=gksudo pantheon-files %U
Gettext-Domain=pantheon-files
```

To enable open file as root : 
```
sudo touch /usr/share/contractor/file-openasroot.contract && gksudo gedit /usr/share/contractor/file-openasroot.contract
```
When the file opens, paste below and close it.
```
[Contractor Entry]
Name=Open file as root
Icon=gedit
Description=open file as root with gedit
MimeType=text
Exec=gksudo gedit %U
Gettext-Domain=gedit
```

# Supported platforms
Tested on Elementary OS Loki 0.4.1. It should work on any Debian based system unless the opposite is mentioned in the description.

# source	
This script is inspired by :
https://github.com/Devil505/elementaryos-postinstall

# Status
There is currently no known bug.