all: vim tmux zsh

EXECUTABLES = curl sed sudo
K := $(foreach exec,$(EXECUTABLES),\
        $(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH")))

vim:
	set -x
	sudo ./install neovim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p $$HOME/.config/nvim
	cp init.vim $$HOME/.config/nvim/
	nvim +silent +VimEnter +PlugInstall +qall

tmux:
	sudo ./install tmux
	cp .tmux.conf $$HOME/

zsh:
	sudo ./install zsh
	cp .zshrc $$HOME/
	bash -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true
	cp intika.zsh-theme $$HOME/.oh-my-zsh/custom/themes/
	sed -i "s/robbyrussell/intika/g" .zshrc
	chsh -s $$(command -v zsh) || true
