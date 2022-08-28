## Updates ##
sudo dnf upgrade -y

# Enable EPEL
sudo dnf install -y --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-$(rpm -E %rhel).noarch.rpm
# Enable RPMFusion free and nonfree
sudo dnf install -y --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-$(rpm -E %rhel).noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-$(rpm -E %rhel).noarch.rpm

# https://github.com/Silejonu/Linux-desktop-post-install/blob/main/modules/distributions/config_redhat_family.sh
source ./modules/distributions/config_redhat_family.sh

## Additional software ##
# LibreOffice
sudo dnf install -y libreoffice-{calc,draw,impress,writer}
# Video codecs for Firefox
sudo dnf install -y ffmpeg gstreamer1-libav
