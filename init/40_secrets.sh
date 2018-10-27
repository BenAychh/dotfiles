#!/bin/zsh
read "email?Lastpass email? ";

lpass login "$email";

lpass show known_hosts --notes > ~/.ssh/known_hosts;

lpass show dotfiles_ssh_key --notes --field='Private Key' > ~/.ssh/id_rsa