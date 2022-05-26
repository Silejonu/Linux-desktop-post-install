## Package management ##
# Change the mirrors
message "${message_mint_mirrors}"
mintsources
# Update the package manager…
sudo mintupdate-cli -ry upgrade
# … then upgrade the packages
sudo mintupdate-cli -ry upgrade
# Install proprietary software/codecs
sudo apt install -y mint-meta-codecs
# Install numlockx for automatic numlock support (needs to be enabled by the user)
sudo apt install -y numlockx
# Automatically update Cinnamon components
gsettings set com.linuxmint.updates auto-update-cinnamon-spices true
# Automatically update Flatpaks
gsettings set com.linuxmint.updates auto-update-flatpaks true
# Automatically purge old kernels
sudo systemctl enable mintupdate-automation-autoremove.timer
