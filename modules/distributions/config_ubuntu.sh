## Interface ##
# Hide the "snap" directory in /home
grep -qx snap ~/.hidden &> /dev/null || echo snap >> ~/.hidden
# Hide "firefox.tmp" in the Downloads directory
grep -qx firefox.tmp $(xdg-user-dir DOWNLOAD)/.hidden &> /dev/null || echo firefox.tmp >> $(xdg-user-dir DOWNLOAD)/.hidden
# Disable error messages when an application crashes
sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport
# Change the favourites in Dash-to-Dock
if [[ $(printf "%s" "${XDG_SESSION_DESKTOP}") == 'ubuntu' ]] ; then
  gsettings set org.gnome.shell favorite-apps "['firefox_firefox.desktop', 'org.gnome.Nautilus.desktop', 'libreoffice-startcenter.desktop', 'rhythmbox.desktop', 'snap-store_ubuntu-software.desktop', 'yelp.desktop']"
fi

## Package management ##
# Update the database
sudo apt update
# Prevent wslu from installing to avoid bug https://bugs.launchpad.net/ubuntu/+source/wslu/+bug/1971757
sudo apt-mark hold wslu
# Update the packages
sudo apt upgrade -y
# Install Firefox .deb to improve integration
sudo apt install -y firefox
# Install proprietary codecs
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt install -y ubuntu-restricted-extras
# Install DVD support
sudo DEBIAN_FRONTEND=noninteractive apt install -y libdvd-pkg
sudo DEBIAN_FRONTEND=noninteractive dpkg-reconfigure libdvd-pkg
# Install firewall GUI
sudo apt install -y gufw
# iOS devices filesystem support
sudo apt install -y ifuse
# Add Timeshift
sudo apt install -y timeshift
