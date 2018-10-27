#!/bin/bash

# Case-insensitive globbing (used in pathname expansion)
setopt nocaseglob

alias grep='grep --color=auto'

# Prevent less from clearing the screen while still showing colors.
export LESS=-XR

# SSH auto-completion based on entries in known_hosts.

# "fuck"
if [[ "$(which thefuck)" ]]; then
  eval $(thefuck --alias)
fi