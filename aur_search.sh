#!/usr/bin/bash

word=${1:-$(xclip -o -selection primary 2>/dev/null || wl-paste 2>/dev/null)}

WA=https://aur.archlinux.org/packages/$word


if curl "$WA" | grep "Wikipedia does not have an article with this exact name404 - Page Not Found."; then
 notify-send "AUR package: $word not found"
else
 notify-send "AUR package: $word found" && vivaldi $WA
fi
