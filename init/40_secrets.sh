#!/bin/sh

# read -p 'Lastpass Email: ' email

# lpass login "$email";

lpass show known_hosts --notes > ~/.ssh/known_hosts;
lpass show dotfiles_ssh_key --notes --field='Private Key' > ~/.ssh/id_rsa
lpass show dotfiles_ssh_key --notes --field='Public Key' > ~/.ssh/id_rsa.pub

chmod 600 ~/.ssh/id_rsa