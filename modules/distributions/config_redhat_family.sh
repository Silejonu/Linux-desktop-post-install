## Updates ##
sudo dnf upgrade -y
sudo dnf autoremove -y
flatpak update -y
flatpak remove -y --unused

## Flatpak ##
# Add Flathub
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# Autoselect RPM packages instead of Flatpaks in GNOME Software
gsettings set org.gnome.software packaging-format-preference "['RPM', 'flatpak']"

## RPMFusion ##
# Enable the appropriate RPMFusion repos
case $(cat /etc/*-release 2> /dev/null | grep ^NAME | sed 's/NAME=//' | tr -d \"\') in
  'Fedora Linux')
    # Enable RPMFusion free and nonfree
    sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    ;;
  'CentOS Stream')
    # Enable EPEL
    sudo dnf install -y --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E %rhel).noarch.rpm
    # Enable RPMFusion free and nonfree
    sudo dnf install -y --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm
    ;;
esac
# Add the Appstream metadata
sudo dnf groupupdate -y core
# Install the multimedia packages needed by gstreamer enabled applications
sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
# Install the sound-and-video complement packages needed by some applications
sudo dnf groupupdate -y sound-and-video
# Install tainted repo
sudo dnf install -y rpmfusion-free-release-tainted
# Install DVD support
sudo dnf install -y libdvdcss
# Install tainted-nonfree repo
sudo dnf install -y rpmfusion-nonfree-release-tainted
# Install missing firmwares
sudo dnf install -y \*-firmware

## Additional software ##
# Firewall GUI
sudo dnf install -y firewall-config
# iOS devices filesystem support
sudo dnf install -y ifuse
# Microsoft fonts
sudo dnf install -y cabextract xorg-x11-font-utils
sudo rpm -i https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
# Install WEBP images support for desktop environments which lack it by default
case $(printf "%s" "${XDG_SESSION_DESKTOP}") in
  gnome)
    sudo dnf install -y webp-pixbuf-loader
    xdg-mime default org.gnome.eog.desktop image/webp
    ;;
  cinnamon)
    sudo dnf install -y webp-pixbuf-loader
    ;;
  xfce)
    sudo dnf install -y webp-pixbuf-loader
    xdg-mime default org.xfce.ristretto.desktop image/webp
    ;;
esac
# Install .rar archive support for desktop environments which lack it by default
case $(printf "%s" "${XDG_SESSION_DESKTOP}") in
  xfce) sudo dnf install -y unrar ;;
esac
# Install GNOME Extension manager for GNOME
if [[ $(printf "%s" "${XDG_SESSION_DESKTOP}") == 'gnome' ]] ; then
  flatpak install -y com.mattjakeman.ExtensionManager
  #sudo dnf install -y file-roller file-roller-nautilus
fi

## Nvidia ##
if [[ $(lspci | grep -ci NVIDIA) -gt 0 ]] ; then
  sudo dnf install -y akmod-nvidia
fi
