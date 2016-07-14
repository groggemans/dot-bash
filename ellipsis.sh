#!/usr/bin/env bash
##############################################################################
# @file ellipsis.sh
# @date January, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

# Install package
pkg.install() {
    : #No action
}

##############################################################################

# Link package
pkg.link() {
    # Link files
    fs.link_file bashrc
    fs.link_file bash_profile
    fs.link_file bash_logout

    # Link package into ~/.config/bash
    mkdir -p "$ELLIPSIS_HOME/.config"
    fs.link_file "$PKG_PATH" "$ELLIPSIS_HOME/.config/bash"
}

##############################################################################

# Unlink package
pkg.unlink() {
    # Remove config dir
    rm "$ELLIPSIS_HOME/.config/bash"

    # Remove all links in the home folder
    hooks.unlink
}

##############################################################################

# Uninstall package
pkg.uninstall() {
    : #No action
}

##############################################################################
