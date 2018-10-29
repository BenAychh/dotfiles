# Dotfiles

My OSX / Manjaro dotfiles.

## About this project

Forked and heavily stolen from [Cowboy's dotfiles](https://github.com/cowboy/dotfiles). Modified to be a bit simpler and prefer Manjaro/Zsh/Oh-my-zsh. If you want your own version, you should definitely fork cowboy's version and not mine - his is much cleaner and mine strips a lot of this away.

[dotfiles]: bin/dotfiles

## How the "dotfiles" command works

When [dotfiles][dotfiles] is run for the first time, it does a few things:

1. In Manjaro, Git is installed if necessary via pacman (it's already there in OSX).
1. This repo is cloned into your user directory, under `~/.dotfiles`.
1. Files in `/copy` are copied into `~/`. ([read more](#the-copy-step))
1. You are prompted to choose scripts in `/init` to be executed. The installer attempts to only select relevant scripts, based on the detected OS and the script filename.
1. Your chosen init scripts are executed (in alphanumeric order, hence the funky names). ([read more](#the-init-step))
1. Files in `/link` are symlinked into `~/`. ([read more](#the-link-step))

On subsequent runs, step 1 is skipped, step 2 just updates the already-existing repo, and step 4 remembers what you selected the last time. The other steps are the same.

### Other subdirectories

* The `/backups` directory gets created when necessary. Any files in `~/` that would have been overwritten by files in `/copy` or `/link` get backed up there.
* The `/bin` directory contains executable shell scripts (including the [dotfiles][dotfiles] script) and symlinks to executable shell scripts. This directory is added to the path.
* The `/caches` directory contains cached files, used by some scripts or functions.
* The `/conf` directory just exists. If a config file doesn't **need** to go in `~/`, reference it from the `/conf` directory.
* The `/source` directory contains files that are sourced whenever a new shell is opened (in alphanumeric order, hence the funky names).
* The `/test` directory contains unit tests for especially complicated bash functions.

### The "copy" step
Any file in the `/copy` subdirectory will be copied into `~/`. Any file that _needs_ to be modified with personal information (like [copy/.gitconfig](copy/.gitconfig) which contains an email address and private key) should be _copied_ into `~/`. Because the file you'll be editing is no longer in `~/.dotfiles`, it's less likely to be accidentally committed into your public dotfiles repo.

### The "init" step
Scripts in the `/init` subdirectory will be executed. A whole bunch of things will be installed, but _only_ if they aren't already.

### The "link" step
Any file in the `/link` subdirectory gets symlinked into `~/` with `ln -s`. Edit one or the other, and you change the file in both places. Don't link files containing sensitive data, or you might accidentally commit that data! If you're linking a directory that might contain sensitive data (like `~/.ssh`) add the sensitive files to your [.gitignore](.gitignore) file!

#### OS X

* Minor XCode init via the [init/10_osx_xcode.sh](init/10_osx_xcode.sh) script
* Homebrew via the [init/20_osx_homebrew.sh](init/20_osx_homebrew.sh) script
* Homebrew recipes via the [init/30_osx_homebrew_recipes.sh](init/30_osx_homebrew_recipes.sh) script
* Homebrew casks via the [init/30_osx_homebrew_casks.sh](init/30_osx_homebrew_casks.sh) scriptscript

#### Manjaro
* Pacman packages and git-extras via the [init/30_manjaro_pacman.sh](init/30_manjaro_pacman.sh) script

#### Both
* known hosts, ssh keys from lastpass (prompts you to login) via the [init/40_secrets.sh](init/40_secrets.sh) scripts
* nvm and the latest version of node via the [init/60_node.sh](init/60_node.sh) script

## Scripts
In addition to the aforementioned [dotfiles][dotfiles] script, there are a few other [bin scripts](bin).

* [dotfiles][dotfiles] - (re)initialize dotfiles. It might ask for your password (for `sudo`).
* [src](link/.bashrc#L8-18) - (re)source all files in `/source` directory
* Look through the [bin](bin) subdirectory for a few more.

## License
Copyright (c) 2014 "Cowboy" Ben Alman  
Licensed under the MIT license.  
<http://benalman.com/about/license/>
