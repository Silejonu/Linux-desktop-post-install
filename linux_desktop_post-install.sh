#!/usr/bin/bash

if [[ $(locale language) == French ]] ; then
  echo
  echo 'Ce script a changé d’adresse ! Il est désormais disponible ici :'
  echo 'https://codeberg.org/Silejonu/Linux-desktop-post-install'
  echo
  echo 'Merci d’utiliser la commande suivante pour le lancer :'
  echo
  echo 'cd $(mktemp -d) && wget https://codeberg.org/Silejonu/Linux-desktop-post-install/archive/main.tar.gz && tar xf main.tar.gz && cd linux-desktop-post-install && bash ./linux_desktop_post-install.sh'
  echo
else
  echo
  echo 'This script has moved repos! It is now available at:'
  echo 'https://codeberg.org/Silejonu/Linux-desktop-post-install'
  echo
  echo 'Please use the following command from now on:'
  echo
  echo 'cd $(mktemp -d) && wget https://codeberg.org/Silejonu/Linux-desktop-post-install/archive/main.tar.gz && tar xf main.tar.gz && cd linux-desktop-post-install && bash ./linux_desktop_post-install.sh'
  echo
fi
