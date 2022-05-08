## Gestionnaire de mises à jour ##
# Change the mirrors
message "${message_mint_mirrors}"
mintsources
# Mettre à jour le gestionnaire de mises à jour…
message "${message_mintupdate}"
sudo mintupdate-cli -ry upgrade
# … et mettre à jour les paquets
sudo mintupdate-cli -ry upgrade
# Installer les paquets propriétaires
sudo apt install -y mint-meta-codecs
# Installer numlockx pour pouvoir activer automatiquement le verrouillage numérique au démarrage de la session
sudo apt install -y numlockx
# Mettre à jour les composants Cinnamon automatiquement
gsettings set com.linuxmint.updates auto-update-cinnamon-spices true
# Mettre à jour les Flatpaks automatiquement
gsettings set com.linuxmint.updates auto-update-flatpaks true
# Retirer les noyaux obsolètes et leurs dépendances automatiquement
sudo systemctl enable mintupdate-automation-autoremove.timer
