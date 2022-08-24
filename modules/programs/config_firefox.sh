# Install uBlock Origin
message "${message_ublock_origin}"
firefox https://addons.mozilla.org/firefox/addon/ublock-origin/ &
wait $(pidof firefox)

# Find Firefox's preferences file
preferences_file="$(find ${HOME}/.mozilla/firefox -iname *default-*)/prefs.js"
if [[ -d ${HOME}/snap/firefox ]] ; then
  preferences_file="$(find ${HOME}/snap/firefox/common/.mozilla/firefox -iname *default | head -n1)/prefs.js"
fi

# Determine the preferences that should be changed
preferences=(
  # Disable the Pocket extension
  'user_pref("extensions.pocket.enabled", false);'
  # Use OS settings for the locale
  'user_pref("intl.regional_prefs.use_os_locales", true);'
  # Unpin sponsored search engines on new tab page
  'user_pref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned", "amazon");'
  # Do not show sponsored websites on new tab page
  'user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);'
  # Enable standard Enhanced Tracking Protection
  'user_pref("browser.contentblocking.category", standard);'
  # Allow Firefox to send backlogged crash reports on your behalf
  'user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", true);'
  # Hide titlebar
  'user_pref("browser.tabs.inTitlebar", 1);'
  # Remove shortcuts in new tab page
  'user_pref("browser.newtabpage.pinned", "[]");'
)

# Check each setting
for line in "${preferences[@]}" ; do
  # Save the setting's name
  option=$(printf "${line}" | cut -d'"' -f2)
  # Check if the settings is already set…
  option_exists=$(grep -sc "${option}" "${preferences_file}")
  # … and replace it by the chosen value…
  if [[ "${option_exists}" -ne 0 ]] ; then
    sed -i 's/*${option}*/${line}/' "${preferences_file}"
  # … or create it if it doesn't exist
  else
    echo "${line}" >> "${preferences_file}"
  fi
done

# Remove "Import bookmarks from another browser to Firefox." button
sed -i 's/\\"import-button\\",//' "${preferences_file}"
# Remove shortcuts in new tab page
sed -i 's/browser.newtabpage.pinned//' "${preferences_file}"

# Fix issues with Firefox on Linux Mint
case $(cat /etc/*-release 2> /dev/null | grep ^NAME | sed 's/NAME=//' | tr -d \"\') in
  'Linux Mint')
    # Add locale packages (circumvent https://github.com/linuxmint/linuxmint/issues/509)
    sudo apt install -y firefox-locale-*
    # Add system spell checkers to Firefox (circumvent https://github.com/linuxmint/linuxmint/issues/510 & https://bugzilla.mozilla.org/show_bug.cgi?id=1786896)
    echo 'user_pref("spellchecker.dictionary_path", "/usr/share/hunspell");' >> "${preferences_file}"
esac
