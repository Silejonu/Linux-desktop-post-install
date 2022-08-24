# Enable firewall
sudo ufw enable

# Install localisation packages
sudo apt install -y language-selector-common
sudo apt install -y $(check-language-support)

# Add HEIF images support
sudo apt install -y heif-gdk-pixbuf heif-thumbnailer
xdg-mime default $(xdg-mime query default image/png) image/heic

# Remove obsolete packages
sudo apt autoremove -y
