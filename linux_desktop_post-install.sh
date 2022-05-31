#!/usr/bin/bash

version='v0.2.3'

# Determine the language of the messages
if [[ $(locale language) == French ]] ; then
  source ./translations/fra.sh
else
  source ./translations/eng.sh
fi

# Handle notifications and terminal prompts
message() {
  notify-send --hint=int:transient:1 "Post-installation" "${1}"
  echo "${1}"
}

# Prevent running the script as root
if [[ ${UID} == 0 ]] ; then
  message "${message_root}"
  exit 1
fi

# Run the script for the appropriate desktop environment
case $(printf "%s" "${XDG_SESSION_DESKTOP}") in
  gnome|ubuntu)
    source ./modules/desktop_environments/config_gnome.sh ;;
  cinnamon)
    source ./modules/desktop_environments/config_cinnamon.sh ;;
  xfce|xubuntu)
    source ./modules/desktop_environments/config_xfce.sh ;;
esac

# Run the script for the appropriate distribution
case $(cat /etc/*-release 2> /dev/null | grep ^NAME | sed 's/NAME=//' | tr -d \"\') in
  Ubuntu)
    source ./modules/distributions/config_ubuntu.sh
    source ./modules/distributions/config_ubuntu_based.sh
    source ./modules/programs/config_timeshift.sh
    # Manually install proprietary drivers
    message "${message_install_proprietary_drivers}"
    software-properties-gtk --open-tab=4
    wait "$(pidof software-properties-gtk)"
    ;;
  'Linux Mint')
    source ./modules/distributions/config_mint.sh
    source ./modules/distributions/config_ubuntu_based.sh
    source ./modules/programs/config_timeshift.sh
    # Manually install proprietary drivers
    message "${message_install_proprietary_drivers}"
    nohup sudo mintdrivers &> /dev/null
    until [[ $(pgrep mintdrivers | wc -l) == 0 ]] ; do
      sleep 1
    done
    ;;
  'Fedora Linux')
    source ./modules/distributions/config_fedora.sh
    ;;
  'CentOS Stream')
    source ./modules/distributions/config_centos.sh
    ;;
esac

source ./modules/programs/config_firefox.sh

message "${message_confirmation}"
