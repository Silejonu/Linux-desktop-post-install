## Updates ##
sudo dnf upgrade -y

## Flatpak ##
# Circumvent https://github.com/flatpak/flatpak/issues/4831
sudo flatpak remote-delete flathub

# Enable RPMFusion free and nonfree
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# https://github.com/Silejonu/Linux-desktop-post-install/blob/main/modules/distributions/config_redhat_family.sh
source ./modules/distributions/config_redhat_family.sh

# Microsoft fonts
sudo dnf install -y cabextract xorg-x11-font-utils
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
