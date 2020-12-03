setup:
	make brew
	make vim
	make symlink
	make macos
	source ~/.zshrc

brew:
	./scripts/homebrew.sh

symlink:
	./scripts/create_symlink.sh

vim:
	./scripts/setup_vim.sh

macos:
	./scripts/macos.sh
