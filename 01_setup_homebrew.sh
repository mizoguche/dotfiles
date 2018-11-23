#!/bin/sh

# Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Make sure using latest Homebrew
brew update
# Update already-installed formula (takes too much time, I will do it manually later)
brew upgrade
brew bundle
