#!/bin/bash

set -ouex pipefail

# Copy system_files overlay to /
cp -avf "/ctx/system_files"/. /

### OS Identity
# Patch user-facing fields in os-release while preserving Aurora/Fedora version metadata
# (ID_LIKE keeps fedora/aurora for package manager and tool compatibility)
sed -i \
    -e 's|^NAME=.*|NAME="SectlyOS"|' \
    -e 's|^PRETTY_NAME=.*|PRETTY_NAME="SectlyOS"|' \
    -e 's|^ID=.*|ID=sectlyos|' \
    -e 's|^ID_LIKE=.*|ID_LIKE="aurora fedora"|' \
    -e 's|^HOME_URL=.*|HOME_URL="https://github.com/Sectly/sectly-os"|' \
    -e 's|^BUG_REPORT_URL=.*|BUG_REPORT_URL="https://github.com/Sectly/sectly-os/issues"|' \
    -e 's|^SUPPORT_URL=.*|SUPPORT_URL="https://github.com/Sectly/sectly-os"|' \
    -e 's|^VARIANT=.*|VARIANT="SectlyOS"|' \
    -e 's|^VARIANT_ID=.*|VARIANT_ID=sectlyos|' \
    /etc/os-release

grep -q "^LOGO="       /etc/os-release || echo 'LOGO=sectlyos'           >> /etc/os-release
grep -q "^VARIANT="    /etc/os-release || echo 'VARIANT="SectlyOS"'      >> /etc/os-release
grep -q "^VARIANT_ID=" /etc/os-release || echo 'VARIANT_ID=sectlyos'     >> /etc/os-release

### Packages

## Enable COPRs
dnf5 -y copr enable imput/helium
dnf5 -y copr enable varlad/zed

## Install packages
dnf5 install -y \
    helium-bin \
    firefox \
    nano \
    zed \
    bash-completion \
    starship \
    fzf

## Disable COPRs -- repos must not persist in the image (updates come from image rebuilds)
dnf5 -y copr disable imput/helium
dnf5 -y copr disable varlad/zed
