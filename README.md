# Krivaten Dotfiles

## Before
Ensure you have the following installed

- HomeBrew
- git
- tmux
- vim
- ack
- NeoBundle

## Installations
### Homebrew
```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew install git
$ brew install tmux
$ brew install ack
$ brew install tig
$ brew install vim --with-override-system-vi
```

### Oh My Zsh
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### NeoBundle
```
$ curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
$ sh ./install.sh
```

## Getting Started
```
$ git clone https://github.com/krivaten/dotfiles.git ~/dotfilez
$ cd ~/dotfilez
$ bash symlink.sh
```
