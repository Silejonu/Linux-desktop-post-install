#!/usr/bin/bash

version='v0.2.1'

if [[ $(locale language) == French ]] ; then
  source ./translations/fra.sh
else
  source ./translations/eng.sh
fi

if [[ ${UID} == 0 ]] ; then
  echo "${message_root}"
  exit 1
fi

case $(printf "%s" "${XDG_SESSION_DESKTOP}") in
  gnome|ubuntu)
    bash ./modules/desktop_environments/config_gnome.sh ;;
  cinnamon)
    bash ./modules/desktop_environments/config_cinnamon.sh ;;
  xfce|xubuntu)
    bash ./modules/desktop_environments/config_xfce.sh ;;
esac

case $(cat /etc/*-release 2> /dev/null | grep ^NAME | sed 's/NAME=//' | tr -d \"\') in
  Ubuntu)
    bash ./modules/distributions/config_ubuntu.sh
    bash ./modules/distributions/config_ubuntu_based.sh
    bash ./modules/programs/config_timeshift.sh
    # Manually install proprietary drivers
    software-properties-gtk --open-tab=4
    wait "$(pidof software-properties-gtk)"
    ;;
  'Linux Mint')
    bash ./modules/distributions/config_mint.sh
    bash ./modules/distributions/config_ubuntu_based.sh
    bash ./modules/programs/config_timeshift.sh
    # Manually install proprietary drivers
    nohup sudo mintdrivers &> /dev/null
    until [[ $(pgrep mintdrivers | wc -l) == 0 ]] ; do
      sleep 1
    done
    ;;
  'Fedora Linux' )
    bash ./modules/distributions/config_fedora.sh
    ;;
esac

bash ./modules/programs/config_firefox.sh

notify-send --hint=int:transient:1 "Post-installation" "${message_confirmation}"
printf "%s\n" "${message_confirmation}"

exit 0



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
