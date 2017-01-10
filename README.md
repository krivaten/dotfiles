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
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
$ brew install git
$ brew install tmux
$ brew install ack
$ brew install vim --with-override-system-vi
```

### NeoBundle
```
$ curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
$ sh ./install.sh
```

## Instructions
- `git clone https://github.com/krivaten/dotfiles.git dotfilez`
- `cd dotfilez`
- `bash symlink.sh`
- Restart terminal
