##############################################################################
# @file ellipsis.sh
# @date January, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

# Minimal ellipsis version
ELLIPSIS_VERSION_DEP='1.9.0'

# Package dependencies (informational/not used!)
ELLIPSIS_PKG_DEPS='groggemans/dot-shell'

##############################################################################

pkg.install() {
    # groggemans/shell package should be installed (rough check)
    if ! ellipsis.list_packages | grep "$ELLIPSIS_PACKAGES/shell"; then
        log.fail "Unmet dependency 'groggemans/dot-shell'"
        return 1
    fi
}

##############################################################################

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

pkg.unlink() {
    # Remove config dir
    rm "$ELLIPSIS_HOME/.config/bash"

    # Remove all links in the home folder
    hooks.unlink
}

##############################################################################

pkg.uninstall() {
    : # No action
}

##############################################################################
