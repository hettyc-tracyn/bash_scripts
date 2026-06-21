#!/usr/bin/bash

word=${1:-$(xclip -o -selection primary 2>/dev/null || wl-paste 2>/dev/null)}

word="${word// /_}"

WA=https://en.wikipedia.org/wiki/$word


if curl "$WA" | grep "Wikipedia does not have an article with this exact name."; then
 notify-send "Wikipedia article about $word not found"
else
 notify-send "Wikipedia article about $word found" && vivaldi $WA
fi
