# Enable firewall
sudo ufw enable

# Install localisation packages
sudo apt install -y language-selector-common
sudo apt install -y $(check-language-support)

# Add HEIF support
sudo apt install -y heif-gdk-pixbuf heif-thumbnailer

# Remove obsolete packages
sudo apt autoremove -y
