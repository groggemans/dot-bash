##############################################################################
# @file bash_profile
# @date January, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

if [ -f ~/.profile ]; then
   source ~/.profile
fi

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

##############################################################################
# vim: ft=sh
