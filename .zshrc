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

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export NLS_LANG=$LANG

####################################################################
## Customizations

export PGDATA=/usr/local/var/postgres

alias zconf="vi ~/.zshrc"
alias szconf="source ~/.zshrc"
alias vg="vagrant"
alias exm="exercism"
alias cat="ccat"

# tmux
# use our executable compiled from source - TODO: don't need this anymore?
#alias tmux="env TERM=xterm-256color ~/work/oss/tmux/tmux"
alias tma="tmux attach-session -t"
alias tmls="tmux list-sessions"

# vim
export NVIM_TUI_ENABLE_TRUE_COLOR=1
alias vim="NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim"
alias vi="vim"

# Disable flow control commands (keeps C-s from freezing everything)
# (via https://github.com/r00k/dotfiles/blob/master/zshrc)
stty start undef
stty stop undef

# git
alias gst='git status'
alias gca='git commit -a'
alias glg='git l'
alias gpl='git pull'
alias gdf='git diff'
alias gpo='git push origin'
alias gpp='git pull; git push origin'
alias gbr='git branch'
alias gstapp='git stash pop'
alias gaa='git add -A'
alias gh='git config --get remote.origin.url | ruby -ne "puts %{https://github.com/#{\$_.split(/.com[\:\/]/)[-1].gsub(%{.git},%{})}}"| xargs open'

# projects
alias cdsad='cd ~/files/music/live/sets/Song-A-Day\ 2021\ Project/mixes'
alias cdds='cd ~/work/donorstack/src/lupine'
alias cdfm='cd ~/work/ir/freshmac/FreshmacBackend'
alias cdvs="cd ~/files/music/live/sets/Variety\ Show\ 2020\ Project"

# ruby/rails
alias be='bundle exec'
alias ss='spring stop'

# node
alias npmwtf='rm -rf ./node_modules && npm install'
alias rnwtf='watchman watch-del-all && rm -rf ./node_modules && npm install && npm start -- --reset-cache'
alias nr='npm run'

# link
#source ~/.linkdevrc
#alias sshvp='ssh -i ~/.ssh/id_rsa_vportal_prod vportal@video.linktv.org -t "cd sites/vportal; bash -l"'

# turn off paging for postgres
alias psql='psql -P pager'

# java
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"

# android
export ANDROID_HOME=/Users/darin/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# ios
alias iosim='open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app'

# heroku
alias hr="heroku"
alias hrc="heroku run rails console"

# digital ocean
alias sshdo='ssh -i ~/.ssh/id_rsa_pdb elixir@138.68.196.144'
alias sshds='ssh -i ~/.ssh/id_rsa_ds donorstack@45.55.108.205'

# donorstack
source ~/.dsdevrc
alias startredis='redis-server /usr/local/etc/redis.conf'

# aws
source ~/.awsrc

# petaluma map
source ~/.aws_env

# slack token (for Slack CLI)
source ~/.slack-token

# ucb
alias pdemo='ssh -i ~/.ssh/portal-qa-01.pem ubuntu@portal-demo.berkeley.edu'
source ~/.ucb_env
export RAILS_MASTER_KEY=`cat ~/.ucb_rails_master_key`
export VSPA_HOME='/Users/darin/work/ir/ucb/vspa'

# elastic beanstalk
export PATH=$PATH:~/Library/Python/2.7/bin

# elixir
export STRIPE_SECRET_KEY=sk_test_vrBvHVCm7JlUJl1uwEC6ZBQD
export SMTP_PORT=1025
export ERL_AFLAGS="-kernel shell_history enabled"
alias phs='iex -S mix phx.server'
alias mdep='mix deps.get && mix deps.compile'
alias mem='mix ecto.migrate'
alias mer='mix ecto.rollback'
alias ixm='iex -S mix'

# crossconnect
source ~/.cc_dev_env

# ecto book
alias cdeb='cd ~/files/writing/ecto_book/wmecto/Book'
export SVN_EDITOR=nvim

export WEBKIT=true

vimgem() {
  gemdir=`bundle info $1 | sed -n 's/.*Path: //p'`
  vim -c "cd $gemdir"
}

vimdep() {
  vim -c "cd deps/$1"
}

gemdoc() {
  gem rdoc $1 --rdoc
  (cd `gem env gemdir`/doc/$1*; open rdoc/index.html)
}

# FIX ME!
tmlg() {
  tmux select-layout "0: ~* (3 panes) [203x48] [layout 20b5,203x48,0,0{90x48,0,0[90x24,0,0,0,90x23,0,25,2],112x48,91,0,1}] @0 (active) 1: ~- (3 panes) [203x48] [layout 7f94,203x48,0,0[203x24,0,0{101x24,0,0,3,101x24,102,0,6},203x23,0,25,5]] @1"
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
  if [ -e "bin/rails" ]
  then
    bin/rails s
  else
    be rails s
  fi
}

rirb() {
  if [ -e "bin/rails" ]
  then
    bin/rails c
  else
    be rails c
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

function versions() {
  local POSTGRES_USED=$(grep -E '\bpg\b' Gemfile | grep -Ev '^\s*#')
  echo "### Installed Versions ###"
  ruby --version
  rails --version
  [[ -n $POSTGRES_USED ]] && psql --version
  echo

  echo "### Target Versions ###"
  echo "# Ruby #"
  echo "2.6*"
  echo "2.5 → 2.5.1"
  echo "2.4 → 2.4.4"
  echo "2.3 → 2.3.7"
  echo "2.2 → 2.2.10: EOL"
  echo "# Rails #"
  echo "5 → 5.2.0"
  echo "4 → 4.2.10"
  echo "3 → 3.2.22.5"
  call_function_if_it_exists project_versions
}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# added by travis gem
[ -f /Users/darin/.travis/travis.sh ] && source /Users/darin/.travis/travis.sh

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash



