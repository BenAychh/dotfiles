#!/bin/sh

source $(brew --prefix nvm)/nvm.sh
# Install latest stable Node.js, set as default, install global npm modules.
nvm install node

# place this after nvm initialization!
