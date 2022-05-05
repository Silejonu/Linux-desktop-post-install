## Interface ##
# Afficher le dossier utilisateur sur le bureau
xfconf-query --channel xfce4-desktop --property /desktop-icons/file-icons/show-home --type bool --set "true"
# Afficher la corbeille sur le bureau
xfconf-query --channel xfce4-desktop --property /desktop-icons/file-icons/show-trash --type bool --set "true"
# Afficher les périphériques amovibles sur le bureau
xfconf-query --channel xfce4-desktop --property /desktop-icons/file-icons/show-removable --type bool --set "true"
# Cache le système de fichier sur le bureau
xfconf-query --channel xfce4-desktop --property /desktop-icons/file-icons/show-filesystem --type bool --set "false"
# Afficher la date dans le tableau de bord
xfconf-query --channel xfce4-panel --property $(xfconf-query -l --channel xfce4-panel | grep digital-format) --type string --set "%A %d %B %H:%M"
# Cacher l’ordinateur et le système de fichiers dans Thunar
xfconf-query --channel thunar --property /hidden-bookmarks --create --type string --set "computer:///" --type string --set "file:///" --force-array
# Organiser les icônes du bureau
xfdesktop --arrange
