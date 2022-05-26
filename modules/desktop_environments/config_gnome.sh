## Files (Nautilus) ##
# Show thumbnails for all files
gsettings set org.gnome.nautilus.preferences show-image-thumbnails always
# Always search in subfolders
gsettings set org.gnome.nautilus.preferences recursive-search always
# Count number of files in folders for all folders
gsettings set org.gnome.nautilus.preferences show-directory-item-counts always
# Show columns Name, Size, Type, Date modified & Starred in list view
gsettings set org.gnome.nautilus.list-view default-visible-columns "['name', 'size', 'type', 'date_modified', 'starred']"

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
