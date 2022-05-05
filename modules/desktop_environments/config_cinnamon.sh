## Explorateur de fichiers ##
# Toujours afficher les vignettes d’aperçu des images/documents (y compris sur les périphériques externes)
gsettings set org.nemo.preferences show-image-thumbnails always
# Afficher les vignettes pour les documents faisant 64 Go au maximum (au lieu de 4 Go par défaut)
gsettings set org.nemo.preferences thumbnail-limit 68719476736
# Toujours afficher le nombre d'éléments (y compris sur les périphériques externes)
gsettings set org.nemo.preferences show-directory-item-counts always
## Interface ##
# Afficher la corbeille sur le bureau
gsettings set org.nemo.desktop trash-icon-visible true
# Cacher le Poste de travail sur le bureau
gsettings set org.nemo.desktop computer-icon-visible false
# Afficher la date dans l'horloge
gsettings set org.cinnamon.desktop.interface clock-show-date true
# Régler la mise en veille automatique sur 15 minutes
gsettings set org.cinnamon.desktop.session idle-delay 900
## Sécurité & confidentialité ##
# Supprimer automatiquement les fichiers temporaires après 30 jours
gsettings set org.cinnamon.desktop.privacy remove-old-temp-files true
# Supprimer automatiquement les fichiers de la corbeille après 30 jours
gsettings set org.cinnamon.desktop.privacy remove-old-trash-files true
