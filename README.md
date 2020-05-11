# dotfiles

To utilize this first install packages

```bash
sudo apt install $(cat pkglist)
```

Next create symbolic links

Install NeoBundle

```bash
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
```

Install oh-my-zsh
```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```


```bash
sudo ln -s ~/dev/dotfiles/.zshrc ~/.zshrc
sudo ln -s ~/dev/dotfiles/.vimrc ~/.vimrc
sudo ln -s ~/dev/dotfiles/.agignore ~/.agignore
```

