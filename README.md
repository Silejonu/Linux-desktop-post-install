# Linux desktop post-install
Post-install script aimed at general-purpose desktop Linux distributions.

## Goals of this script

- One-stop-script to configure a freshly installed Linux system.
- The configuration is targeted towards non-technical users and Linux beginners (the typical target demographic is someone attending an install party).
- As little manual intervention as possible, everything that can be automated will be automated.
- Targets the latest *(LTS)* release of a given distro.
- Every change done to the default distribution configuration is meant to improve user-friendliness, and does not include purely personal preferences.
- Accounts for localisation.

### Currently supported distributions
- Ubuntu
- Linux Mint

### Currently supported desktop environments
- GNOME
- Cinnamon
- XFCE

*The script will automatically detect the distribution and desktop environment, and will run the appropriate configuration.*

## To-do

- Support for Fedora Workstation
- Comments cleanup
