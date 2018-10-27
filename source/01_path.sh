#!/bin/bash
paths=(
  ~/.local/bin
  $DOTFILES/bin
)

export PATH
for p in "${paths[@]}"; do
  [[ -d "$p" ]] && PATH="$PATH:$p:$(path_remove "$p")"
done
unset p paths
