#!/bin/sh

# OSX-only stuff. Abort if not OSX.
is_osx || return 1

# Exit if Homebrew is not installed.
[[ ! "$(type -P brew)" ]] && e_error "Brew recipes need Homebrew to install." && return 1

# Homebrew recipes
recipes=(
  git
  git-extras
  thefuck
  tree
  wget
  nvm
)

brew_install_recipes

brew install lastpass-cli --with-pinentry
