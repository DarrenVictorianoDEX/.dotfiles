#!/bin/sh

# iTerm2: Setup Font
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Normal Font' 'MesloLGS-NF-Regular 14'" ~/Library/Preferences/com.googlecode.iterm2.plist
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

# iTerm2: Set window Title to ""
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Custom Window Title' ''" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Use Custom Window Title' 1" ~/Library/Preferences/com.googlecode.iterm2.plist

# iTerm2: Set unlimited scrolling
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Scrollback Lines' 0" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Unlimited Scrollback' 1" ~/Library/Preferences/com.googlecode.iterm2.plist

# iTerm2: Set window size
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Columns' 100" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Rows' 30" ~/Library/Preferences/com.googlecode.iterm2.plist

# iTerm2: Terminal Type
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Terminal Type' 'xterm-256color'" ~/Library/Preferences/com.googlecode.iterm2.plist

# iTerm2: Hide Scroll bar and make Theme to Minimal
defaults write com.googlecode.iterm2 "HideScrollbar" 1
defaults write com.googlecode.iterm2 "TabStyleWithAutomaticOption" 5

# Finder: Hide hard drives on desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

# Finder: Hide removable media hard drives on desktop
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Finder: Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: Show hidden files inside the finder
defaults write com.apple.finder "AppleShowAllFiles" -bool true

# Finder: Show Status Bar
defaults write com.apple.finder "ShowStatusBar" -bool true

# Finder: Set search scope to current folder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# MacOS: disable press and hold for vim motion
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# MacOS make dock auto-hide animation fast
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -float 0.4
killall Dock

echo "app settings updated!"