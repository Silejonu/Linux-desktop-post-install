# Enable firewall
sudo ufw enable

# Install localisation packages
sudo apt install -y language-selector-common
sudo apt install -y $(check-language-support)
# Remove obsolete packages
sudo apt autoremove -y
