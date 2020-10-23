setup:
	make brew
	./02_setup_vim.sh
	./03_setup_copy_dotfiles.sh
	defaults write com.apple.finder AppleShowAllFiles -bool YES
	defaults write com.apple.desktopservices DSDontWriteNetworkStores true
	defaults write com.apple.finder QLEnableTextSelection -bool true
	source ~/.zshrc

brew:
	./01_setup_homebrew.sh
