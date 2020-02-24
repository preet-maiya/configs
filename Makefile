
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
	chsh -s $$(which zsh)
	cp .zshrc $$HOME/
  sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	cp intika.zsh-theme $$HOME/.oh-my-zsh/custom/themes/
	sed -i "s/robbyrussell/intika/g" .zshrc


