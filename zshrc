export ZSH=/Users/$USER/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="agnoster"
ZSH_DISABLE_COMPFIX="true"

# Plugins
plugins=(git, trash)

# User configuration
source $ZSH/oh-my-zsh.sh

# Context: user@hostname (who am I and where am I)
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "KVH"
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {

  local PL_BRANCH_CHAR
  () {
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
    PL_BRANCH_CHAR=$'\ue0a0' # 
  }
  local ref dirty mode repo_path
  repo_path=$(git rev-parse --git-dir 2>/dev/null)

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git rev-parse --short HEAD 2> /dev/null)"
    if [[ -n $dirty ]]; then
      prompt_segment yellow black
    else
      prompt_segment green black
    fi

    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr ' '
    zstyle ':vcs_info:*' unstagedstr ' '
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats ' %u%c'
    vcs_info
    echo -n "${ref/refs\/heads\//$PL_BRANCH_CHAR }${vcs_info_msg_0_%% }${mode}"
  fi
}

# Personal Aliases
alias g='git'
alias e='ember'
alias etS='e t -sf KVH'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gu='git reset --soft HEAD~1'
alias cd43='cd ~/Documents/Q2/ngam-43'
alias cdq='cd ~/Documents/Q2/ngam-43'
alias cdp='cd ~/Documents/Personal/'
alias cdwp='cd /Applications/MAMP/htdocs/communitas/wp-content/themes'
alias gpo='git push -u origin'
alias ts='tig status'
alias evim='vim ~/.vimrc'
alias ezsh='vim ~/.zshrc'
alias eac='sudo vim /opt/cisco/anyconnect/profile/Q2-SPLIT-VPN-PROFILE.xml'
alias v='vim'
alias y='yarn'
alias vc='vim -c CtrlP'
alias vn='vim -c NERDTree'
alias vnginx='vim /usr/local/etc/nginx/nginx.conf'
alias dswp='find . -type f -name "*.swp" -delete';

qGrepFunction() {
    grep -rI --exclude-dir={node_modules,bower_components,tmp} $1 ~/Documents/Q2/{ngam-424/q2-uux/addon,addons}
}
alias qGrep=qGrepFunction

export NVM_DIR="/Users/kvanhouten/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export PATH="$PATH:$HOME/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin" # Add RVM to PATH for scripting
export PGDATA=/usr/local/var/postgres

# added by travis gem
[ -f /Users/kvanhouten/.travis/travis.sh ] && source /Users/kvanhouten/.travis/travis.sh

cd_nvm_use() {
  if [[ -a ".nvmrc" ]]; then
    NODE_VERSION=$(nvm version)
    NVM_VERSION=$(nvm version $(cat ".nvmrc"))
    if [ $NODE_VERSION != $NVM_VERSION ]; then
      nvm use
    fi
  fi
}

cd() {
  builtin cd "$@"
  unset NODE_NAME
  cd_nvm_use
}
