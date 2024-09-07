#!/bin/bash

# make dock auto-hide animation fast
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -float 0.4
killall Dock

# disable press and hold for vim motion
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
