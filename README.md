# Linux desktop post-install
Post-install script aimed at general-purpose desktop Linux distributions.

# Run the script
```bash
cd $(mktemp -d) && wget https://github.com/Silejonu/Linux-desktop-post-install/archive/refs/heads/main.zip && unzip main.zip && cd Linux-desktop-post-install-main && bash ./linux_desktop_post-install.sh
```

# Goals of this script
- One-stop-script to configure a freshly installed Linux system.
- The configuration is targeted towards non-technical users and Linux beginners (the typical target demographic is someone attending an install party).
- As little manual intervention as possible, everything that can be automated will be automated.
- If it can't be automated, the program will open itself, a notification will tell you what to do, and the script will proceed after the program is closed.
- Targets the latest *(LTS, if applicable)* release of a given distro. Older releases *should* work, but there is no guarantee.
- Every change done to the default distribution configuration is meant to improve user-friendliness, and does not include purely personal preferences.
- Accounts for localisation.
- Should be ran just once right after a fresh install, but won't break anything if ran a thousand times.

# What it actually does
- Update the system
- Install proprietary codecs, fonts and drivers
- Add uBlock Origin to Mozilla Firefox
- Small tweaks to the desktop environment aimed at better user-friendliness/cleaner UI
- Enable Timeshift on systems with more than 200GB of disk capacity
- Enable the firewall

## Currently supported distributions
- Ubuntu
- Linux Mint
- Fedora Workstation

## Currently supported desktop environments
- GNOME
- Cinnamon
- XFCE

*The script will automatically detect the distribution and desktop environment, and will run the appropriate configuration.*

# To-do

- [x] Support for Fedora Workstation
- [ ] Automatically configure Linux Mint's mirrors (currently defaults to using mirrors in France)
- [ ] Comments cleanup / translation
