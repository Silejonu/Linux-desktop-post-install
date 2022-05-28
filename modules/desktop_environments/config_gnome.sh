## Interface ##
# Show weekday in the clock
gsettings set org.gnome.desktop.interface clock-show-weekday true
# Show battery percentage
gsettings set org.gnome.desktop.interface show-battery-percentage true

## Security & privacy ##
# Set sleep delay to 15 minutes
gsettings set org.gnome.desktop.session idle-delay 900
# Automatically delete temporary files (after 30 days by default)
gsettings set org.gnome.desktop.privacy remove-old-temp-files true
# Automatically delete old trash files (after 30 days by default)
gsettings set org.gnome.desktop.privacy remove-old-trash-files true

## Peripherals ##
# Enable tap-to-clik on the touchpad
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
