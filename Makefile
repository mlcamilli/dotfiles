SHELL=/bin/bash

BASEDIR := "$(CURDIR)"

install: packages tmux zsh nvim ripgrep asdf pipx link


link:
	# zsh
	ln -sfn ${BASEDIR}/.zshrc ~/.zshrc
	# nvim
	ln -sfn ${BASEDIR}/init.vim ~/.config/nvim/init.vim
	ln -sfn ${BASEDIR}/coc-settings.json ~/.config/nvim/coc-settings.json
	# git
	ln -sfn ${BASEDIR}/.gitconfig ~/.gitconfig
	# Tmux
	ln -sfn ${BASEDIR}/.tmuxp ~/.tmuxp
	ln -sfn ${BASEDIR}/.tmux.conf ~/.tmux.conf

# Install Tmux
tmux:
	curl -sLo ~/tmux.tar.gz https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz
	tar -zxf ~/tmux.tar.gz
	cd ~/tmux; sh configure; make && sudo make install
	rm -rf tmux; rm tmux.tar.gz
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

zsh:
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


nvim:
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod +x nvim.appimage
	sudo mv nvim.appimage /usr/bin/nvim
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\ ~/.local/share/nvim/site/pack/packer/start/packer.nvim


ripgrep:
	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
    sudo dpkg -i ripgrep_13.0.0_amd64.deb
	rm ripgrep_13.0.0_amd64.deb

packages:
	sudo apt install $(cat pkglist)


asdf:
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf
	asdf plugin add nodejs
	asdf plugin add python
	bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
	asdf install nodejs 16.13.0
	asdf global nodejs 16.13.0
	asdf install python 3.10.5
	asdf global python 3.10.5

pipx:
	python3 -m pip install --user pipx
	python3 -m pipx ensurepath
	pipx install tmuxp black isort flake8

winyank:
	curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
	unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
	chmod +x /tmp/win32yank.exe
	sudo mv /tmp/win32yank.exe /usr/local/bin/
