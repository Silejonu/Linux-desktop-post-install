config_ubuntu_based() {
  ## Sécurité & confidentialité ##
  # Activer le pare-feu
  sudo ufw enable
  ## Gestionnaire de paquets ##
  # Installer le gestionnaire de tâches htop
  sudo apt install -y htop
  # Installer les paquets de langues manquants
  sudo apt install -y language-selector-common
  sudo apt install -y $(check-language-support)
  # Supprimer les paquets obsolètes
  sudo apt autoremove -y
}
