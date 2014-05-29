#source ~/work/ms/svn/users/ken/bash_helper.sh
# if [ -f /opt/local/etc/bash_completion ]; then
#       . /opt/local/etc/bash_completion
# fi
# source ~/.git-completion.bash
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

if [[ -f "$HOME/.aws" ]]; then
  source "$HOME/.aws";
fi

export CLICOLOR=1

export ANDROID_HOME=/Users/darin/android/sdk

export PATH=/opt/local/bin:/opt/local/sbin:~/bin:/Developer/usr/bin:/usr/local/mysql/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:/Applications/Postgres.app/Contents/MacOS/bin:~/work/github/cordova-enyo/bin:~/bin/mongo/bin:~/work/rust/bin:$PATH
export PS1='[\u@\h \W]$(__git_ps1 "(%s)") '
export EDITOR=vi

export GIT_HOME=/Users/darin/work/link/src

# open links in new tabs
defaults write com.apple.Safari TargetedClicksCreateTabs -bool true

alias ls='ls -F'
alias rirb='rails console'
# alias rirb='./script/runner ~/bin/pry_rails.rb'
alias lm='lmate'
alias tm='mate'
alias mysql='mysql --auto-rehash'
alias cdcap='cd ~/work/ms/svn/capistrano'
alias mbp='mvim ~/.bash_profile'
alias sbp='source ~/.bash_profile'
alias st='cd ~/work/speedytest'
alias stc='./script/console test'
alias cds='cd ~/files/audio/masters/songaday-2013'
alias ars='sudo /usr/sbin/apachectl restart'
alias lmn='ssh linkmedia@news1.linktv.org'
alias rbserver='ruby -run -e httpd . -p 8000'
alias mstr='cd /files/audio/masters'
alias currip="ifconfig | grep 'inet.*broadcast' | cut -d ' ' -f 2"
alias vg='vagrant'

# projects
alias cdh="cd $GIT_HOME/homer"
alias cdv="cd $GIT_HOME/vportal"
alias cdx="cd ~/work/exercises/exercism/javascript"
alias cdk="cd ~/work/katas"
alias cdsad="cd ~/files/music/reason/songs/song-a-day\ 2014/"

# rvm
alias rsys='rvm system; which ruby'
alias r9='rvm use ruby-1.9.3-p327'
alias rv='ruby -v'
alias rln='rvm use ruby-1.8.7-p334-linknews'

# rails
alias rsrv='rails server'
alias rcon='rails console'

# js
alias jn='jasmine-node'

# steroids
alias ss='steroids'

alias ltvstart='rake sunspot:solr:start; rake linktv_platform:sunspot:reindex; script/delayed_job start'

alias be='bundle exec'

alias cdp='cd vendor/plugins/linktv_platform'

alias ec2='ssh -l ec2-user -i ~/.ssh/linktvnews-keypair.pem ec2-50-16-152-23.compute-1.amazonaws.com'

# cordova
alias cb='cordova build'
alias cbi='cordova build ios'
alias cba='cordova build android'
alias ce='cordova emulate'
alias cei='cordova emulate ios'
alias cea='cordova emulate android'

cr() {
  cordova build $1
  cordova emulate $1
}

# simple
alias cds='cd ~/work/rss/src/simpletv/trunk/Products/Players/iosPlayer/'

# git
alias g="cd $GIT_HOME/linktv_news"
alias ga="cd ~/work/link/xcode/linktvnewsapp"
alias gadd='git add'
alias gst='git status'
alias gdf='git diff --color'
alias gbr='git branch'
alias gco='git checkout'
alias gca='git commit -a'
alias glg='git log'
alias glgd='git log --author=darin'
alias gpl='git pull'
alias gdammit='git checkout -- *'
alias gap='git add --patch'
alias gdc='git diff --cached'
alias gsta='git stash'
alias gstap='git stash apply'
alias gstapp='git stash pop'
alias gcleanup='git clean -fdx'
alias glast='git --no-pager log -1 --no-merges --author=darin --pretty=oneline'
alias gsu='git submodule update'
alias rmschema='git checkout -- db/schema.rb'

gnewbr() {
	git fetch
	git checkout -tlb $1 origin/$1
}

gpush() {
	git push origin $1
}

gpp() {
	gpl
	gpush $1
	glast
}

gprojbr() {
	git checkout -b $1 master
	git push origin -u $1
}

# enable bash completion on aliases
__git_complete gco _git_checkout
__git_complete gpush _git_checkout
__git_complete gpp _git_checkout

rbg() { 
	grep $1 `find . -name '*.rb'` 
}

ff() {
	open -a Firefox $1
}

cmate() {
  touch $1
  mate $1
}

killdb() {
  pushd .
  cd ~/Library/Application\ Support/iPhone\ Simulator/  
  find . -name LinkTvNews.sqlite -exec rm -i {} \;
  popd
}

cbr() {
  cordova build $1 && cordova emulate $1
}

rsnap() {
  wget -E -H -k -K -p -nc --restrict-file-names=windows $1
}

ggrep() {
  gem list --local | grep $1
}

 
# complete -W '`\ls -1d $HOME/work/ms/svn/main/branches/* | ruby -nae "puts split(%q(/)).last"`' br mbr cmbr brup
# 
# complete -W '`\ls -1d $GIT_HOME/.git/refs/heads/* | ruby -nae "puts split(%q(/)).last"`' gco gpush gpull gpp

source ~/.bashrc

##
# Your previous /Users/darin/.bash_profile file was backed up as /Users/darin/.bash_profile.macports-saved_2010-04-17_at_00:10:46
##

# MacPorts Installer addition on 2010-04-17_at_00:10:46: adding an appropriate PATH variable for use with MacPorts.
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

##
# Your previous /Users/darin/.bash_profile file was backed up as /Users/darin/.bash_profile.macports-saved_2011-05-04_at_16:54:01
##

# MacPorts Installer addition on 2011-05-04_at_16:54:01: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

[[ -s /Users/darin/.nvm/nvm.sh ]] && . /Users/darin/.nvm/nvm.sh # This loads NVM

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
