# Linux desktop post-install
Post-install script aimed at general-purpose desktop Linux distributions.

# Run the script
```bash
cd $(mktemp -d)
wget https://github.com/Silejonu/Linux-desktop-post-install/archive/refs/heads/main.tar.gz
tar xf main.tar.gz
cd Linux-desktop-post-install-main
bash ./linux_desktop_post-install.sh
```
One-liner:
```bash
cd $(mktemp -d) && wget https://github.com/Silejonu/Linux-desktop-post-install/archive/refs/heads/main.tar.gz && tar xf main.tar.gz && cd Linux-desktop-post-install-main && bash ./linux_desktop_post-install.sh
```

# Goals of this script
- One-stop-script to configure a freshly installed Linux system.
- Should be run just once right after a fresh install, but won't break anything if ran a thousand times.
- The configuration is targeted towards non-technical users and Linux beginners (the typical target demographic is someone attending an install party).
- As little manual intervention as possible, everything that can be automated will be automated.
- If it can't be automated, the program needing to be configured will open itself, a notification will tell you what to do, and the script will proceed after the program is closed.
- Targets the latest *(LTS, if applicable)* release of a given distro. Older and newer releases *should* work, but there is no guarantee.
- Every change done to the default distribution configuration is meant to improve user-friendliness, and does not include purely personal preferences.
- Accounts for localisation.
- Everything in the script must be clearly commented so one can know what the script does before running it.
- Circumvents bugs in the distributions/desktop environments. [[1]](https://github.com/flatpak/flatpak/issues/4831) [[2]](https://bugs.launchpad.net/ubuntu/+source/wslu/+bug/1971757)

# What it actually does
- Update the system
- Install proprietary codecs, fonts and drivers
- Add uBlock Origin to Mozilla Firefox
- Remove sponsored stuff from Mozilla Firefox's interface
- Small tweaks to the desktop environment aimed at better user-friendliness/cleaner UI
- Enable Timeshift on Ubuntu-based systems with more than 200GB of disk capacity
- Enable the firewall
- And more!

## Currently supported distributions
- Ubuntu LTS
- Linux Mint
- Fedora Workstation
- CentOS Stream *(yes, you read that right)*

## Currently supported desktop environments
- GNOME
- Cinnamon
- XFCE

*The script will automatically detect the distribution and desktop environment, and will run the appropriate configuration.*

# To-do

- [ ] Translate text with `gettext`
- [ ] Automatically configure Linux Mint's mirrors (probably not feasible)
- [ ] Setup microphone echo/noise cancellation (if needed)
- [ ] Webp support for Ubuntu-based distros
