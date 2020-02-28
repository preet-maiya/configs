
vim:
	set -x
	sudo ./install neovim
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
