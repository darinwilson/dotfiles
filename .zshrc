# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dmw"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$HOME/.local/bin:$HOME/.node/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NLS_LANG=$LANG

# need this for ERSO
export USE_MAILCATCHER=yes

####################################################################
## Customizations

export PGDATA=/usr/local/var/postgres

alias zconf="vi ~/.zshrc"
alias szconf="source ~/.zshrc"
alias vg="vagrant"
alias exm="exercism"
alias cat="ccat"

# tmux
alias tma="tmux attach-session -t"
alias tmls="tmux list-sessions"

# vim
alias nvim="/Users/darin/work/oss/neovim/nvim-macos-arm64/bin/nvim"
#export NVIM_TUI_ENABLE_TRUE_COLOR=1
#alias vim="NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias vi="nvim"

# Disable flow control commands (keeps C-s from freezing everything)
# (via https://github.com/r00k/dotfiles/blob/master/zshrc)
stty start undef
stty stop undef

# git
alias gst='git status'
alias gca='git commit -a'
alias glg='git log --oneline --graph'
alias gpl='git pull'
alias gdf='git diff'
alias gpo='git push origin'
alias gpp='git pull; git push origin'
alias gbr='git branch'
alias gstapp='git stash pop'
alias gaa='git add -A'
alias gh='git config --get remote.origin.url | ruby -ne "puts %{https://github.com/#{\$_.split(/.com[\:\/]/)[-1].gsub(%{.git},%{})}}"| xargs open'
unalias gl
alias gl='git config --get remote.origin.url | ruby -ne "puts %{https://gitlab.com/#{\$_.split(/.com[\:\/]/)[-1].gsub(%{.git},%{})}}" | xargs open'

# projects
alias cdsad='cd ~/files/music/Song-A-Day\ 2024'

# ruby/rails
alias be='bundle exec'
alias ss='spring stop'
alias vimgem='bundle open'
alias killpuma='ps | grep puma | grep -v "grep" | cut -f 1 -d " " | xargs kill -9'
alias rta='bin/rails test:all'
alias rsp='bundle exec rspec'
alias rspff='bundle exec rspec --fail-fast'

# kamal
alias kmd='bin/kamal deploy'
alias kms='bin/kamal shell'
alias kmc='bin/kamal console'

# node
alias npmwtf='rm -rf ./node_modules && npm install'
alias rnwtf='watchman watch-del-all && rm -rf ./node_modules && npm install && npm start -- --reset-cache'
alias nr='npm run'
export N_PREFIX="$HOME/.node"

# jekyll
alias jsrv='bundle exec jekyll serve'

# open website for brew package
brew-info() { brew info $@ | grep -Eo "^https?://[^[:space:]]+" | xargs open }

# link
#source ~/.linkdevrc
#alias sshvp='ssh -i ~/.ssh/id_rsa_vportal_prod vportal@video.linktv.org -t "cd sites/vportal; bash -l"'

# turn off paging for postgres
alias psql='psql -P pager'

# java
#export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH


# android
export ANDROID_HOME=/Users/darin/Library/Android/sdk
export PATH=$JAVA_HOME/bin:$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# ios
alias iosim='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'

# heroku
alias hr="heroku"
alias hrc="heroku run rails console"

# donorstack
source ~/.dsdevrc
alias startredis='redis-server /usr/local/etc/redis.conf'

# aws
source ~/.awsrc

# petaluma map
source ~/.aws_env

# server info
source ~/.servers

# ucb
source ~/.ucb_env
export RAILS_MASTER_KEY=`cat ~/.ucb_rails_master_key`

# elixir
export ERL_AFLAGS="-kernel shell_history enabled"
alias phs='iex -S mix phx.server'
alias mdep='mix deps.get && mix deps.compile'
alias mem='mix ecto.migrate'
alias mer='mix ecto.rollback'
alias ixm='iex -S mix'

# pyenv config
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# docker
alias dcu='docker-compose up'

vimdep() {
  vim -c "cd deps/$1"
}

gemdoc() {
  gem rdoc $1 --rdoc
  (cd `gem env gemdir`/doc/$1*; open rdoc/index.html)
}

gtrack() {
  git fetch
  git branch --track $1 origin/$1
  git checkout $1
}

gbrc() {
  git branch $1
  git checkout $1
}

# source: http://paulstamatiou.com/hosting-on-amazon-s3-with-cloudfront/
flushdns() {
  dig $1 +trace @a.root-servers.net
}

# Rails shortcuts that are backwards compatible
rsrv() {
  if [ -e "bin/dev" ]
  then
    bin/dev
  elif [ -e "bin/rails" ]
  then
    bin/rails s
  else
    be rails s
  fi
}

rirb() {
  if [ -e "bin/rails" ]
  then
    bin/rails c $1
  else
    be rails c $1
  fi
}

rdb() {
  if [ -e "bin/rails" ]
  then
    bin/rails dbconsole -p
  else
    be rails dbconsole -p
  fi
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# added by travis gem
[ -f /Users/darin/.travis/travis.sh ] && source /Users/darin/.travis/travis.sh

eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(rbenv init - zsh)"

# launch associated tmux session if we're in VS Code
if [ $TERM_PROGRAM = "vscode" ]
then
  vscode_tmux_launch
fi

. "$HOME/.asdf/asdf.sh"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f "/Users/darin/.ghcup/env" ] && . "/Users/darin/.ghcup/env" # ghcup-env
