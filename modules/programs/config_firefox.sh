## Firefox ##
notify-send --hint=int:transient:1 "Post-installation" "${firefox_notification}"
printf "%s\n" "${firefox_notification}"
# Ouvrir Firefox sur la page d’installation d’uBlock Origin
firefox https://addons.mozilla.org/firefox/addon/ublock-origin/ &
# Attendre que Firefox soit fermé avant de continuer
wait $(pidof firefox)
# Identifier le répertoire du profil principal de Firefox
fichier_preferences="$(find ${HOME}/.mozilla/firefox -iname *default-release*)/prefs.js"
if [[ -d ${HOME}/snap/firefox ]] ; then
  fichier_preferences="$(find ${HOME}/snap/firefox/common/.mozilla/firefox -iname *default | head -n1)/prefs.js"
fi
# Définir les préférences à modifier
preferences=(
  # Désactiver l’extension Pocket
  'user_pref("extensions.pocket.enabled", false);'
  # Utiliser les paramètres du système d’exploitation pour la locale
  'user_pref("intl.regional_prefs.use_os_locales", true);'
  # Désépingler les moteurs de recherche
  'user_pref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned", "amazon");'
  # Ne pas afficher les raccourcis sponsorisés dans les nouveaux onglet
  'user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);'
  # Protection renforcée contre le pistage = Standard
  'user_pref("browser.contentblocking.category", standard);'
  # Autoriser Firefox à envoyer des rapports de plantage en attente en votre nom
  'user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", true);'
  # Ne pas afficher la barre de titre
  'user_pref("browser.tabs.inTitlebar", 1);'
  # Désépingler les raccourcis dans les nouveaux onglets
  #'user_pref("browser.newtabpage.pinned", []);'
)
# Vérifier chaque paramètre un à un
for ligne in "${preferences[@]}" ; do
  # Enregistrer l’intitulé nu des paramètres dans la variable « option »
  option=$(printf "${ligne}" | cut -d'"' -f2)
  # Chercher quelles options existent déjà dans le fichier de configuration
  option_existe=$(grep -sc "${option}" "${fichier_preferences}")
  # Si une option existe déjà, alors remplacer la ligne…
  if [[ "${option_existe}" -ne 0 ]] ; then
    sed -i 's/*${option}*/${ligne}/' "${fichier_preferences}"
    # … sinon, la créer
  else
    echo "${ligne}" >> "${fichier_preferences}"
  fi
done
# Enlever le bouton « Importer les marques-pages d’un autre navigateur dans Firefox. »
sed -i 's/\\"import-button\\",//' "${fichier_preferences}"
# Désépingler les raccourcis dans les nouveaux onglets
sed -i 's/browser.newtabpage.pinned//' "${fichier_preferences}"
