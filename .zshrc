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
# DISABLE_AUTO_UPDATE="true"

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

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

####################################################################
## Customizations

export PGDATA=/usr/local/var/postgres

alias zconf="vi ~/.zshrc"
alias szconf="source ~/.zshrc"
alias vg="vagrant"

# tmux
alias tmux="TERM=screen-256color-bce tmux"
alias tma="tmux attach-session -t"
alias tmls="tmux list-sessions"

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

# projects
alias cdv='cd ~/work/link/src/vportal'
alias cdu='cd ~/work/ucb/src/apbears'
alias cdcm='cd ~/work/ucb/src/calmsgs-rails3/trunk'
alias cde='cd ~/work/ir/envoy/envoy_android_app'
alias cdsad='cd ~/files/music/sad2016/mixes'
alias cdds='cd ~/work/donorstack/src/lupine'
alias cdto='cd ~/work/ir/trackops/trackops-mobile'

# ruby/rails
alias rirb='rails console'
alias rsrv='rails server'
alias rdb='rails dbconsole -p'

# link
source ~/.linkdevrc
alias sshvp='ssh -i ~/.ssh/id_rsa_vportal_prod vportal@video.linktv.org -t "cd sites/vportal; bash -l"'

# ucb setup
export APBEARS_ORACLE=true
export ORACLE_HOME=/Users/darin/work/ucb/Oracle/instantclient_11_2
export DYLD_LIBRARY_PATH=$ORACLE_HOME
export TNS_ADMIN=$ORACLE_HOME/network/admin
export PATH=$PATH:$ORACLE_HOME
export SVN_EDITOR=vim
  # calmsgs needs svn :(
export SVN_SSH="ssh -i /Users/darin/.ssh/id_dsa_ucb_code"
alias rsldb='git checkout -- db/legacy_test.sqlite3'
alias sshapb='TERM=xterm ssh -i ~/.ssh/id_rsa_ucb darinwilson@as-axolotl-qa.ist.berkeley.edu'
alias sshapbprod='TERM=xterm ssh -i ~/.ssh/id_rsa_ucb darinwilson@as-axolotl-prod.ist.berkeley.edu'
alias sshcms='TERM=xterm ssh -i ~/.ssh/id_rsa_ucb darinwilson@as-ucproposals-qa.ist.berkeley.edu'
alias qadb='ssh -L 40002:dba-oracle-qa-30.ist.berkeley.edu:1533 darinwilson@as-axolotl-qa.ist.berkeley.edu -i ~/.ssh/id_rsa_ucb -N'

# android
export RUBYMOTION_ANDROID_SDK=/Users/darin/.rubymotion-android/sdk
export RUBYMOTION_ANDROID_NDK=/Users/darin/.rubymotion-android/ndk
export ANDROID_HOME=$RUBYMOTION_ANDROID_SDK
export PATH=$PATH:$RUBYMOTION_ANDROID_SDK/tools:$RUBYMOTION_ANDROID_SDK/platform-tools:$ANT_HOME/bin
alias kick="/Users/darin/.rubymotion-android/sdk/platform-tools/adb -d logcat"
alias cdrm='cd ~/work/ruby-motion/android'
alias rd="rake device"

# ios
alias iosim='/Applications/Xcode.app/Contents/Developer/Applications/iOS\ Simulator.app/Contents/MacOS/iOS\ Simulator'

# heroku
alias hr="heroku"
alias hrc="heroku run rails console"

# donorstack
source ~/.dsdevrc
alias startredis='redis-server /usr/local/etc/redis.conf'

# aws
source ~/.awsrc

# elixir
export PATH=$PATH:/usr/local/Cellar/elixir/1.0.5/bin
export STRIPE_SECRET_KEY=sk_test_vrBvHVCm7JlUJl1uwEC6ZBQD
export SMTP_PORT=1025

export WEBKIT=true

#export DATABASE_URL=postgres:///$()

vimgem() {
  gemdir=`bundle show $1`
  vim -c "cd $gemdir"
}

gemdoc() {
  gem rdoc $1 --rdoc
  (cd `gem env gemdir`/doc/$1*; open rdoc/index.html)
}

tmlg() {
  tmux select-layout "0: ~* (3 panes) [203x48] [layout 20b5,203x48,0,0{90x48,0,0[90x24,0,0,0,90x23,0,25,2],112x48,91,0,1}] @0 (active) 1: ~- (3 panes) [203x48] [layout 7f94,203x48,0,0[203x24,0,0{101x24,0,0,3,101x24,102,0,6},203x23,0,25,5]] @1"
}

mcan() {
  motion create --template=android $1 && cd $1
}

# source: http://paulstamatiou.com/hosting-on-amazon-s3-with-cloudfront/
flushdns() {
  dig $1 +trace @a.root-servers.net
}

export NVM_DIR="/Users/darin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
