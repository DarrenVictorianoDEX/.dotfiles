#!/bin/bash

# URL for the MesloLGS font
font_base_url="https://github.com/romkatv/powerlevel10k-media/raw/master"

# Function to install MesloLGS NF font and configure iTerm2 settings
install_font_iterm2() {
    echo "Installing MesloLGS NF font for iTerm2..."

    # Create Fonts directory if it doesn't exist
    mkdir -p ~/Library/Fonts

    # Download and install the fonts
    for style in Regular Bold Italic 'Bold Italic'; do
        file="MesloLGS NF ${style}.ttf"
        echo "Downloading ${file}..."
        curl -fsSL -o ~/Library/Fonts/"${file}" "${font_base_url}/${file// /%20}"
    done

    # Apply the font and additional settings to iTerm2
    echo "Applying font and settings to iTerm2..."
    local size=13  # Default font size, adjust as needed
    /usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Normal Font\" string 'MesloLGS-NF-Regular $size'" ~/Library/Preferences/com.googlecode.iterm2.plist
    /usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Use Non-ASCII Font\" bool false" ~/Library/Preferences/com.googlecode.iterm2.plist
    /usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Draw Powerline Glyphs\" bool true" ~/Library/Preferences/com.googlecode.iterm2.plist
    /usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Terminal Type\" string 'xterm-256color'" ~/Library/Preferences/com.googlecode.iterm2.plist
    /usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Horizontal Spacing\" real 1" ~/Library/Preferences/com.googlecode.iterm2.plist
    /usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Vertical Spacing\" real 1" ~/Library/Preferences/com.googlecode.iterm2.plist
    /usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Minimum Contrast\" real 0" ~/Library/Preferences/com.googlecode.iterm2.plist
    /usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Use Bold Font\" bool true" ~/Library/Preferences/com.googlecode.iterm2.plist
    /usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Use Bright Bold\" bool true" ~/Library/Preferences/com.googlecode.iterm2.plist
    /usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Use Italic Font\" bool true" ~/Library/Preferences/com.googlecode.iterm2.plist
    /usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"ASCII Anti Aliased\" bool true" ~/Library/Preferences/com.googlecode.iterm2.plist
    /usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Non-ASCII Anti Aliased\" bool true" ~/Library/Preferences/com.googlecode.iterm2.plist
    /usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Ambiguous Double Width\" bool false" ~/Library/Preferences/com.googlecode.iterm2.plist
    /usr/libexec/PlistBuddy -c "Set :\"New Bookmarks\":0:\"Only The Default BG Color Uses Transparency\" bool true" ~/Library/Preferences/com.googlecode.iterm2.plist

    echo "Updating iTerm2 settings..."
    defaults read com.googlecode.iterm2

    echo "Font and settings installation for iTerm2 completed!"
}

# Run the installation function
install_font_iterm2