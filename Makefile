setup:
	make brew
	make vim
	make symlink
	defaults write com.apple.finder AppleShowAllFiles -bool YES
	defaults write com.apple.desktopservices DSDontWriteNetworkStores true
	defaults write com.apple.finder QLEnableTextSelection -bool true
	source ~/.zshrc

brew:
	./scripts/homebrew.sh

symlink:
	./scripts/create_symlink.sh

vim:
	./scripts/setup_vim.sh
