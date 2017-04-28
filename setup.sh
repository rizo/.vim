#!/usr/bin/env sh

# MacVim ProTips
# ==============

# Improve the text rendering on Mac OSX:
defaults write org.vim.MacVim MMCellWidthMultiplier 0.9

# Opens all files from other apps in vert split
defaults write org.vim.MacVim MMVerticalSplit YES

# If when changing monitors, your fonts go from nice and thin to ugly and
# bold: This should fix it:
defaults -currentHost write -globalDomain AppleFontSmoothing -int 1

# Speed up full screen transition:
defaults write org.vim.MacVim MMFullScreenFadeTime 0.1



# iTerm requires the following commented code to be placed in your .bashrc in
# order for Vim to show full 256 colors.
# export CLICOLOR=1
# export TERM='xterm-256color'
# if [ -e /usr/share/terminfo/x/xterm-256color ]; then
#   export TERM='xterm-256color'
# else
#   #export TERM='xterm-color'
#   export TERM=xterm-256color
# fi
# If your terminal does *not* support 256 color, if if you want better than
# 256, and are willing to limit to base16 colorschemes you enable this:
# (You probably also need the base16 colorscheme shell script to exist
# somewhere in your path) - See the base16 docs.
# let base16colorspace="256"
set t_Co=256
