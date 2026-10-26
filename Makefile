SHELL=/bin/bash

BASEDIR := $(CURDIR)

install: packages yazi sad tmux eza zsh nvim ripgrep uv link mise zoxide precommit

light: packages zsh nvim ripgrep link precommit

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
	mkdir -p ~/.config/mise && ln -sfn ${BASEDIR}/.config/mise/config.toml ~/.config/mise/config.toml
	mkdir -p ~/.config/yazi && ln -sfn ${BASEDIR}/yazi/yazi.toml ~/.config/yazi/yazi.toml
	mkdir -p ~/.config/btop/ && ln -sfn ${BASEDIR}/.config/btop/btop.conf ~/.config/btop/btop.conf

	# herdr (install is opt-in: make herdr)
	mkdir -p ~/.config/herdr && ln -sfn ${BASEDIR}/.config/herdr/config.toml ~/.config/herdr/config.toml
	ln -sfn ${BASEDIR}/.config/herdr/reviewr-keys.txt ~/.config/herdr/reviewr-keys.txt
	# herdr-plus keeps its config dir across uninstall/upgrade, so linking in is safe
	mkdir -p ~/.config/herdr/plugins/config/cloudmanic.herdr-plus
	ln -sfn ${BASEDIR}/.config/herdr/herdr-plus/projects ~/.config/herdr/plugins/config/cloudmanic.herdr-plus/projects
	ln -sfn ${BASEDIR}/.config/herdr/herdr-plus/worktrees ~/.config/herdr/plugins/config/cloudmanic.herdr-plus/worktrees

	ln -sfn ${BASEDIR}/personal_claude.md ~/.claude/CLAUDE.md
	ln -sfn ${BASEDIR}/skills/ ~/.claude/skills

# Install Tmux
tmux:
	curl -sLo tmux.tar.gz https://github.com/tmux/tmux/releases/download/3.5a/tmux-3.5a.tar.gz
	tar -zxf tmux.tar.gz
	cd tmux-3.5a; sh configure && make; $(if $(NO_SUDO),,sudo )make install
	rm -rf tmux-3.5a; rm tmux.tar.gz
	@if [ ! -d ~/.tmux/plugins/tpm ] ; then \
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm ; \
	fi

# herdr — installed directly from upstream to track latest, and kept out of
# the `install` / `light` chains so a fresh bootstrap never depends on it.
# Requires `make link` first so ~/.config/herdr/ exists.
herdr:
	curl -fsSL https://herdr.dev/install.sh | sh
	PATH="$$HOME/.local/bin:$$PATH" herdr plugin install cloudmanic/herdr-plus --yes

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


# Requires `make link` first so ~/.config/mise/config.toml exists
mise:
	curl -fsSL https://mise.run | sh
	~/.local/bin/mise install

# --python-preference only-managed keeps tool venvs off mise/system pythons, so
# bumping a version in .config/mise/config.toml can't break them
uv:
	curl -LsSf https://astral.sh/uv/install.sh | sh
	for t in tmuxp ruff pre-commit just zizmor parquet-tools tldr; do \
		uv tool install $$t --python-preference only-managed; \
	done

# Rebuild every uv tool venv (use after changing/removing a Python install)
uv-reinstall:
	uv tool upgrade --all --reinstall --python-preference only-managed

# Install the gitleaks pre-commit hook in this repo
precommit:
	command -v pre-commit >/dev/null 2>&1 || uv tool install pre-commit
	cd ${BASEDIR} && pre-commit install

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

fzf:
	rm -rf ~/.fzf || true
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	bash ~/.fzf/install
