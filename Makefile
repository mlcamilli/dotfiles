SHELL=/bin/bash

BASEDIR := $(CURDIR)

install: packages yazi sad tmux eza zsh nvim ripgrep asdf uv link zoxide

light: packages zsh nvim ripgrep link

link:
	# zsh
	ln -sfn ${BASEDIR}/.zshrc ~/.zshrc
	# nvim
	mkdir -p ~/.config && ln -sfn ${BASEDIR}/.config/nvim/ ~/.config/nvim
	# git
	ln -sfn ${BASEDIR}/.gitconfig ~/.gitconfig
	ln -sfn ${BASEDIR}/wezterm ~/.config/wezterm
	# Tmux
	ln -sfn ${BASEDIR}/.tmuxp ~/.tmuxp
	ln -sfn ${BASEDIR}/.tmux.conf ~/.tmux.conf
	ln -sfn ${BASEDIR}/.ripgreprc ~/.ripgreprc
	ln -sfn ${BASEDIR}/.tool-versions ~/.tool-versions
	mkdir -p ~/.config/yazi && ln -sfn ${BASEDIR}/yazi/yazi.toml ~/.config/yazi/yazi.toml
	mkdir -p ~/.config/btop/ && ln -sfn ${BASEDIR}/.config/btop/btop.conf ~/.config/btop/btop.conf


# Install Tmux
tmux:
	curl -sLo tmux.tar.gz https://github.com/tmux/tmux/releases/download/3.5a/tmux-3.5a.tar.gz
	tar -zxf tmux.tar.gz
	cd tmux-3.5a; sh configure && make; $(if $(NO_SUDO),,sudo )make install
	rm -rf tmux-3.5a; rm tmux.tar.gz
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
	curl -L -o nvim.appimage https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage
	chmod u+x nvim.appimage
	$(if $(NO_SUDO),,sudo )rm -f /usr/bin/nvim
	$(if $(NO_SUDO),,sudo )mv nvim.appimage /usr/bin/nvim

ripgrep:
	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.0.1/ripgrep_14.0.1-1_amd64.deb
	$(if $(NO_SUDO),,sudo )dpkg -i ripgrep_14.0.1-1_amd64.deb
	rm ripgrep_14.0.1-1_amd64.deb

packages:
	$(if $(NO_SUDO),,sudo )apt install $(shell cat pkglist)

eza:
	$(if $(NO_SUDO),,sudo )mkdir -p /etc/apt/keyrings
	wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | $(if $(NO_SUDO),,sudo )gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
	echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | $(if $(NO_SUDO),,sudo )tee /etc/apt/sources.list.d/gierens.list
	$(if $(NO_SUDO),,sudo )chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
	$(if $(NO_SUDO),,sudo )apt update
	$(if $(NO_SUDO),,sudo )apt install -y eza

sad:
	wget 'https://github.com/ms-jpq/sad/releases/latest/download/x86_64-unknown-linux-gnu.deb'
	$(if $(NO_SUDO),,sudo )apt install ./x86_64-unknown-linux-gnu.deb

yazi:
	wget https://github.com/sxyazi/yazi/releases/download/v25.5.31/yazi-x86_64-unknown-linux-musl.zip
	unzip yazi-x86_64-unknown-linux-musl
	$(if $(NO_SUDO),,sudo )mv yazi-x86_64-unknown-linux-musl/yazi /usr/local/bin/yazi
	rm -rf yazi-x86_64-unknown-linux-*


asdf:
	curl -sLo asdf.tar.gz https://github.com/asdf-vm/asdf/releases/download/v0.18.0/asdf-v0.18.0-linux-amd64.tar.gz
	$(if $(NO_SUDO),,sudo )tar -xvf asdf.tar.gz -C /usr/local/bin/
	rm asdf.tar.gz
	asdf plugin add nodejs
	asdf plugin add python
	asdf plugin add pnpm
	asdf plugin add ruby
	asdf plugin add golang
	asdf plugin add rust
	asdf install

uv:
	curl -LsSf https://astral.sh/uv/install.sh | sh
	uv tool install tmuxp
	uv tool install ruff

windows:
	curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.1.1/win32yank-x64.zip
	unzip -p /tmp/win32yank.zip win32yank.exe > /tmp/win32yank.exe
	chmod +x /tmp/win32yank.exe
	$(if $(NO_SUDO),,sudo )mkdir -p /mnt/c/Program\ Files/win32yank/
	$(if $(NO_SUDO),,sudo )mv /tmp/win32yank.exe /mnt/c/Program\ Files/win32yank/
	$(if $(NO_SUDO),,sudo )apt install wslu
	$(if $(NO_SUDO),,sudo )ln -sfn /mnt/c/Program\ Files/win32yank/win32yank.exe /usr/local/bin

zoxide:
	curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh


