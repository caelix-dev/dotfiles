#!/bin/bash
 
sh install.sh
sh switch.sh
sh setup-opencode.sh
fnm i --lts
. ~/.zshrc
sh setup-oh-my-opencode.sh
