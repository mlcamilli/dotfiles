SHELL=/bin/bash

BASEDIR := $(CURDIR)

install: packages tmux zsh nvim ripgrep asdf pipx link

light: packages zsh nvim ripgrep link

link:
	# zsh
	ln -sfn ${BASEDIR}/.zshrc ~/.zshrc
	# nvim
	mkdir -p ~/.config && ln -sfn ${BASEDIR}/.config/nvim/ ~/.config/nvim
	# git
	ln -sfn ${BASEDIR}/.gitconfig ~/.gitconfig
	# Tmux
	ln -sfn ${BASEDIR}/.tmuxp ~/.tmuxp
	ln -sfn ${BASEDIR}/.tmux.conf ~/.tmux.conf
	ln -sfn ${BASEDIR}/.ripgreprc ~/.ripgreprc
	ln -sfn ${BASEDIR}/.config/btop/btop.conf ~/.config/btop/btop.conf

# Install Tmux
tmux:
	curl -sLo ~/tmux.tar.gz https://github.com/tmux/tmux/releases/download/3.3a/tmux-3.3a.tar.gz
	tar -zxf ~/tmux.tar.gz -C ~/
	cd ~/tmux-3.3a; sh configure; make && $(if $(NO_SUDO),,sudo ) make install
	rm -rf ~/tmux-3.3a; rm ~/tmux.tar.gz
	@if [ ! -d ~/.tmux/plugins/tpm ] ; then \
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm ; \
	fi

zsh:
	sh -c "$$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
	mkdir ~/.oh-my-zsh/themes/lib
	git clone https://github.com/dracula/zsh.git ~/.oh-my-zsh/themes/lib/dracula
	ln -sfn ~/.oh-my-zsh/themes/lib/dracula/dracula.zsh-theme ~/.oh-my-zsh//themes/dracula.zsh-theme
	git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

nvim:
	curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
	chmod +x nvim.appimage
	$(if $(NO_SUDO),,sudo )rm -f /usr/bin/nvim
	$(if $(NO_SUDO),,sudo )mv nvim.appimage /usr/bin/nvim

ripgrep:
	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.0.1/ripgrep_14.0.1-1_amd64.deb
	$(if $(NO_SUDO),,sudo )dpkg -i ripgrep_14.0.1-1_amd64.deb
	rm ripgrep_14.0.1-1_amd64.deb

packages:
	$(if $(NO_SUDO),,sudo )apt install $(shell cat pkglist)
	wget 'https://github.com/ms-jpq/sad/releases/latest/download/x86_64-unknown-linux-gnu.deb'
	$(if $(NO_SUDO),,sudo )apt install x86_64-unknown-linux-gnu.deb
	rm x86_64-unknown-linux-gnu.deb
	wget https://github.com/sxyazi/yazi/releases/download/v0.2.5/yazi-x86_64-unknown-linux-gnu.zip
	unzip yazi-x86_64-unknown-linux-gnu
	$(if $(NO_SUDO),,sudo )mv yazi-x86_64-unknown-linux-gnu/yazi /usr/local/bin/yazi
	rm -rf yazi-x86_64-unknown-linux-gnu*


asdf:
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf
	asdf plugin add nodejs
	asdf plugin add python
	asdf plugin add pnpm
	bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'
	asdf install nodejs 20.10.0
	asdf install pnpm 8.15.1
	asdf global nodejs 20.10.0
	asdf install python 3.10.5
	asdf global python 3.10.5

pipx:
	@if [ -d ~/.local/pipx ] ; then \
		rm -rf ~/local/pipx; \
	fi
	python -m pip install --user pipx
	python -m pipx ensurepath
	pipx install tmuxp ruff ranger-fm

windows:
	curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
	unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
	chmod +x /tmp/win32yank.exe
	$(if $(NO_SUDO),,sudo )mv /tmp/win32yank.exe /usr/local/bin/
	$(if $(NO_SUDO),,sudo )apt install wslu
	ln -sfn /mnt/c/Program Files/win32yank.exe /usr/local/bin/
