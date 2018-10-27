#!/bin/bash

# Manjaro-only stuff. Abort if not Manjaro.
is_manjaro || return 1

# Package management
alias update="sudo pacman -Syu && sudo yaourt -Syu --aur --noconfirm"

alias pbcopy='xclip -i -selection clipboard'
alias pbpaste='xclip -o -selection clipboard'