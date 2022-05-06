## Interface ##
# Cacher le répertoire « snap » situé dans le dossier home
grep -qx snap ~/.hidden &> /dev/null || echo snap >> ~/.hidden
# Désactiver les messages d'erreur lorsqu'une application malfonctionne en arrière-plan
sudo sed -i 's/enabled=1/enabled=0/' /etc/default/apport
## Gestionnaire de paquets ##
# Mettre à jour la liste des paquets disponibles
sudo apt update
# Mettre à jour les paquets
sudo apt upgrade -y
# Install Firefox .deb to improve integration
sudo apt install -y firefox
# Installer les paquets propriétaires (codecs multimédias, pilotes wi-fi, etc.)
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt install -y ubuntu-restricted-extras
# Installer le support des DVD
sudo DEBIAN_FRONTEND=noninteractive apt install -y libdvd-pkg
sudo DEBIAN_FRONTEND=noninteractive dpkg-reconfigure libdvd-pkg
# Installer une interface graphique au pare-feu
sudo apt install -y gufw
# Install Firefox .deb package to circumvent this bug: https://www.reddit.com/r/Ubuntu/comments/uj3x52/psa_fix_filesdirectories_on_the_desktop_not/
sudo apt install -y firefox
