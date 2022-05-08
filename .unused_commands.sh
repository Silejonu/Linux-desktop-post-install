# This is basically a notepad for me to remember things I may implement, or regularly need to manually do.

### Facultatif ###

### Pour les ordinateurs disposant de 3 Go de mémoire vive ou moins ###
## Activer la compression de la mémoire vive
# sudo apt install zram-config
## Régler le swap sur 4 Go (changer « 4G » pour la valeur désirée)
# sudo swapoff /swapfile ; sudo rm /swapfile ; sudo fallocate -l 4G /swapfile && sudo chmod 600 /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile

## Installer Google Chrome
cd $(mktemp -d) && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && sudo apt install -y ./google-chrome-stable_current_amd64.deb


### À retravailler ###
# ubuntu-drivers list
# ubuntu-drivers install $(ubuntu-drivers list | […])
############################################
# firefox https://addons.mozilla.org/fr/firefox/addon/ublock-origin/ &
# sleep 30
# wmctrl -c "Firefox" -x "Navigator.Firefox"
# sudo apt purge -y wmctrl

############ MINT ##############
## Activer le verrouillage numérique automatiquement
# Paramètres système -> Écran de connexion -> Paramètres -> Activer numlockx

## Agrandir la taille de la barre de défilement :
# Paramètres système -> Thèmes -> Paramètres -> Définir une largeur de barre de défilement
