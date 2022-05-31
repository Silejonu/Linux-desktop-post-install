
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
# Enable EPEL
sudo dnf install -y --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E %rhel).noarch.rpm
# Enable RPMFusion free and nonfree
sudo dnf install -y --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm
# Add the Appstream metadata
sudo dnf groupupdate -y core
# Install the complements multimedia packages needed by gstreamer enabled applications
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
