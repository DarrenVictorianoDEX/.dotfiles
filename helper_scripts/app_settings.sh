#!/bin/bash

# Setup configs for iTerm2
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Normal Font' 'MesloLGS-NF-Regular 14'" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Terminal Type' 'xterm-256color'" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Draw Powerline Glyphs' 1" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Horizontal Spacing' 1" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Vertical Spacing' 1" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Use Bold Font' 1" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Use Bright Bold' 1" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Use Italic Font' 1" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'ASCII Anti Aliased' 1" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Non-ASCII Anti Aliased' 1" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Use Non-ASCII Font' 0" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Ambiguous Double Width' 0" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Columns' 100" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Rows' 30" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Scrollback Lines' 0" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Unlimited Scrollback' 1" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Custom Window Title' ''" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Use Custom Window Title' 1" ~/Library/Preferences/com.googlecode.iterm2.plist

defaults write com.googlecode.iterm2 "HideScrollbar" 1
defaults write com.googlecode.iterm2 "TabStyleWithAutomaticOption" 5

# disable press and hold for vim motion
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# make dock auto-hide animation fast
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -float 0.4
killall Dock

