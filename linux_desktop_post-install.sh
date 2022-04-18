#!/usr/bin/bash

version='v0.1'

if [[ $(locale language) == French ]] ; then
  source ./translations/fr-FR.sh
else
  message_root='Error: do not run this script with superuser privileges.'
  #message_version='Error: a newer version of this script is available at ???'
  message_mintupdate='Starting updates…'
  firefox_notification='Install uBlock Origin and allow it to run in private mode.'
  message_confirmation='Post-install finished. Please reboot the computer.'
fi

if [[ ${UID} == 0 ]] ; then
  echo "${message_root}"
  exit 1
fi

# if [[ $(curl --silent "https://api.github.com/repos/Silejonu/???/releases/latest" | grep '"tag_name":' | cut -d'"' -f4) != "${version}" ]] ; then
#   printf "%s\n" "${message_version}"
#   notify-send --hint=int:transient:1 'Post-installation' "${message_version}"
#   exit 1
# fi

case $(printf "%s" "${XDG_SESSION_DESKTOP}") in
  gnome|ubuntu)
    source ./modules/desktop_environments/config_gnome.sh
    config_gnome ;;
  cinnamon)
    source ./modules/desktop_environments/config_cinnamon.sh
    config_cinnamon ;;
  xfce|xubuntu)
    source ./modules/desktop_environments/config_xfce.sh
    config_xfce ;;
esac

case $(cat /etc/*-release 2> /dev/null | grep ^NAME | sed 's/NAME=//' | tr -d \"\') in
  Ubuntu)
    source ./modules/distributions/config_ubuntu.sh
    config_ubuntu
    source ./modules/distributions/config_ubuntu_based.sh
    config_ubuntu_based
    # Manually install proprietary drivers
    software-properties-gtk --open-tab=4
    wait "$(pidof software-properties-gtk)"
    confirmation ;;
  'Linux Mint')
    source ./modules/distributions/config_mint.sh
    config_mint
    source ./modules/distributions/config_ubuntu_based.sh
    config_ubuntu_based
    # Manually install proprietary drivers
    nohup sudo mintdrivers &> /dev/null
    until [[ $(pgrep mintdrivers | wc -l) == 0 ]] ; do
      sleep 1
    done
    confirmation ;;
esac

source ./modules/programs/config_firefox.sh
config_firefox

source ./modules/programs/config_timeshift.sh
config_timeshift

confirmation() {
  notify-send --hint=int:transient:1 "Post-installation" "${message_confirmation}"
  printf "%s\n" "${message_confirmation}"
}

exit 0


### Facultatif ###

### Pour les ordinateurs portables ###
## Réduire la consommation de la batterie (choisir l'un ou l'autre)
# sudo apt install -y tlp tlp-rdw
# sudo snap install auto-cpufreq && sudo auto-cpufreq --install

### Pour les ordinateurs disposant de 3 Go de mémoire vive ou moins ###
## Activer la compression de la mémoire vive
# sudo apt install zram-config
## Régler le swap sur 4 Go (changer « 4G » pour la valeur désirée)
# sudo swapoff /swapfile ; sudo rm /swapfile ; sudo fallocate -l 4G /swapfile && sudo chmod 600 /swapfile && sudo mkswap /swapfile && sudo swapon /swapfile

## Installer Google Chrome
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo apt install ./google-chrome-stable_current_amd64.deb
# rm ./google-chrome-stable_current_amd64.deb


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
