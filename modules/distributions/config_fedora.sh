## Updates ##
sudo dnf upgrade -y
sudo dnf autoremove -y
flatpak update -y
flatpak remove -y --unused
# Circumvent https://github.com/flatpak/flatpak/issues/4831
sudo flatpak remote-modify flathub --title Flathub --comment "Central repository of Flatpak applications" --description "Central repository of Flatpak applications"
# Add Flathub
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# Autoselect RPM packages instead of Flatpaks in GNOME Software
gsettings set org.gnome.software packaging-format-preference "['RPM', 'flatpak']"

## RPMFusion ##
# Enable RPMFusion free and nonfree
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# Add the Appstream metadata
sudo dnf groupupdate -y core
# Install the complements multimedia packages needed by gstreamer enabled applications
sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
# Install the sound-and-video complement packages needed by some applications
sudo dnf groupupdate -y sound-and-video
# Install tainted repo
sudo dnf install -y rpmfusion-free-release-tainted
# Install DVD support
sudo dnf install -y libdvdcss
# Install tainted-nonfree repo
sudo dnf install -y rpmfusion-nonfree-release-tainted
# Install missing firmwares
sudo dnf install -y \*-firmware

## Additional software ##
sudo dnf install -y htop
sudo dnf install -y firewall-config
# Install Microsoft fonts
sudo dnf install -y cabextract xorg-x11-font-utils
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
# Install GNOME Extension manager if applicable
if [[ $(printf "%s" "${XDG_SESSION_DESKTOP}") == 'gnome' ]] ; then
  flatpak install -y com.mattjakeman.ExtensionManager
fi

## Nvidia ##
if [[ $(lspci | grep -ci NVIDIA) -gt 0 ]] ; then
  sudo dnf install -y akmod-nvidia
fi
