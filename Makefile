setup:
	make brew
	make vim
	make symlink
	make macos
	source ~/.zshrc

brew:
	./scripts/homebrew.sh

symlink:
	./scripts/symlink.sh

vim:
	./scripts/vim.sh

macos:
	./scripts/macos.sh
