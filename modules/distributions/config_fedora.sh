config_fedora() {
## Updates ##
sudo dnf update -y
flatpak update -y
flatpak remove -y --unused
## RPMFusion ##
# Enable RPMFusion free and nonfree
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# Add the Appstream metadata
sudo dnf groupupdate core
# Install the complements multimedia packages needed by gstreamer enabled applications
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
# Install the sound-and-video complement packages needed by some applications
sudo dnf groupupdate sound-and-video
# Install tainted repo
sudo dnf install -y rpmfusion-free-release-tainted
# Install DVD support
sudo dnf install -y libdvdcss
# Install tainted-nonfree repo
sudo dnf install -y rpmfusion-nonfree-release-tainted
# Install missing firmwares
sudo dnf install -y \*-firmware

}
