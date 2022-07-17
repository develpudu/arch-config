#!/usr/bin/env bash
set -eu

rm -f install.asciinema

pacman -Sy
pacman -S --noconfirm asciinema

clear
asciinema rec --stdin -i 5 ~/install.asciinema