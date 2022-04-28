# Linux desktop post-install
Post-install script aimed at general-purpose desktop Linux distributions.

# Run the script
```bash
cd $(mktemp -d) && wget https://github.com/Silejonu/Linux-desktop-post-install/archive/refs/heads/main.zip && unzip main.zip -d ~ && cd ~/Linux-desktop-post-install-main && chmod +x ./linux_desktop_post-install.sh && ./linux_desktop_post-install.sh
```

## Goals of this script
- One-stop-script to configure a freshly installed Linux system.
- The configuration is targeted towards non-technical users and Linux beginners (the typical target demographic is someone attending an install party).
- As little manual intervention as possible, everything that can be automated will be automated.
- Targets the latest *(LTS)* release of a given distro.
- Every change done to the default distribution configuration is meant to improve user-friendliness, and does not include purely personal preferences.
- Accounts for localisation.
- Should be ran just once, but won't break anything if ran a thousand times.

## What it actually does
- Update the system
- Install proprietary codecs, fonts and drivers
- Add uBlock Origin to Mozilla Firefox
- Small tweaks to the desktop environment aimed at better user-friendliness/cleaner UI
- Enable Timeshift on systems with more than 200GB of disk capacity
- Enable the firewall

### Currently supported distributions
- Ubuntu
- Linux Mint

### Currently supported desktop environments
- GNOME
- Cinnamon
- XFCE

*The script will automatically detect the distribution and desktop environment, and will run the appropriate configuration.*

## To-do

- [ ] Support for Fedora Workstation
- [ ] Automatically configure Linux Mint's mirrors (currently defaults to using mirrors in France)
- [ ] Comments cleanup / translation
