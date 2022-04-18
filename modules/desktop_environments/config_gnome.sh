config_gnome() {
  ## Explorateur de fichiers ##
  # Toujours afficher les vignettes d’aperçu des images/documents (y compris sur les périphériques externes)
  gsettings set org.gnome.nautilus.preferences show-image-thumbnails always
  # Afficher les vignettes pour les documents faisant 4 Go au maximum (au lieu de 512 Mo par défaut)
  gsettings set org.gnome.nautilus.preferences thumbnail-limit 4096
  # Lors d’une recherche, chercher dans les sous-dossiers également
  gsettings set org.gnome.nautilus.preferences recursive-search always
  # Toujours afficher le nombre de fichiers dans un dossier
  gsettings set org.gnome.nautilus.preferences show-directory-item-counts always
  # En mode liste, afficher les colonnes Nom, Taille, Type, Dernière modification & Favori
  gsettings set org.gnome.nautilus.list-view default-visible-columns "['name', 'size', 'type', 'date_modified', 'starred']"
  ## Interface ##
  # Afficher le jour de la semaine dans l'horloge
  gsettings set org.gnome.desktop.interface clock-show-weekday true
  ## Sécurité & confidentialité ##
  # Régler la mise en veille automatique sur 15 minutes
  gsettings set org.gnome.desktop.session idle-delay 900
  # Supprimer automatiquement le contenu de la corbeille (au bout de 30 jours par défaut)
  gsettings set org.gnome.desktop.privacy remove-old-trash-files true
  # Supprimer automatiquement les fichiers temporaires (au bout de 30 jours par défaut)
  gsettings set org.gnome.desktop.privacy remove-old-temp-files true
}
