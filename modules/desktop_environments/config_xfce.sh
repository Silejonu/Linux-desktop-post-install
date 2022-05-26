## Interface ##
# Hide the home folder from the desktop
xfconf-query --channel xfce4-desktop --property /desktop-icons/file-icons/show-home --type bool --set "true"
# Show the trash bin to the desktop
xfconf-query --channel xfce4-desktop --property /desktop-icons/file-icons/show-trash --type bool --set "true"
# Show peripherals on the desktop
xfconf-query --channel xfce4-desktop --property /desktop-icons/file-icons/show-removable --type bool --set "true"
# Hide the filesystem from the desktop
xfconf-query --channel xfce4-desktop --property /desktop-icons/file-icons/show-filesystem --type bool --set "false"
# Show date in the taskbar
xfconf-query --channel xfce4-panel --property $(xfconf-query -l --channel xfce4-panel | grep digital-format) --type string --set "%A %d %B %H:%M"
# Hide Computer and filesystem from Thunar's sidebar
xfconf-query --channel thunar --property /hidden-bookmarks --create --type string --set "computer:///" --type string --set "file:///" --force-array
# Rearrange desktop icons
xfdesktop --arrange
