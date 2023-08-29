#!/bin/sh -eux

# Install Homebrew
if ! type brew; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew is alredy installed.\n"
fi

# Make sure using latest Homebrew
brew update

# Update already-installed formula (takes too much time, I will do it manually later)
# brew upgrade

brew bundle --clean
