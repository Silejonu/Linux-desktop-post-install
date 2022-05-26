## Interface ##
# Show Trash on the desktop
gsettings set org.nemo.desktop trash-icon-visible true
# Hide Computer on the desktop
gsettings set org.nemo.desktop computer-icon-visible false
# Show the date in the clock
gsettings set org.cinnamon.desktop.interface clock-show-date true
# Set sleep delay to 15 minutes
gsettings set org.cinnamon.desktop.session idle-delay 900

## Security & privacy ##
# Automatically delete temporary files (after 30 days by default)
gsettings set org.cinnamon.desktop.privacy remove-old-temp-files true
# Automatically delete old trash files (after 30 days by default)
gsettings set org.cinnamon.desktop.privacy remove-old-trash-files true
