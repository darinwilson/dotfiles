#!/usr/bin/env zsh
# This is a slightly tweaked version of the gallois theme

#local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

setopt promptsubst

autoload -U add-zsh-hook

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$FG[073]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[247]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

#Customized git status, oh-my-zsh currently does not allow render dirty status before branch
git_custom_status() {
  local cb=$(current_branch)
  if [ -n "$cb" ]; then
    echo "$(parse_git_dirty)%{$fg_bold[yellow]%}$(work_in_progress)%{$reset_color%}$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

#RVM and git settings
if [[ -s ~/.rvm/scripts/rvm ]] ; then
  RPS1='%{$FG[237]%}[`~/.rvm/bin/rvm-prompt`]%{$reset_color%} $EPS1'
else
  if which rbenv &> /dev/null; then
    RPS1='%{$FG[237]%}[`rbenv version | sed -e "s/ (set.*$//"`]%{$reset_color%} $EPS1'
  else
    if [[ -n `which chruby_prompt_info` && -n `chruby_prompt_info` ]]; then
      RPS1='%{$FG[237]%}[`chruby_prompt_info`]%{$reset_color%} $EPS1'
    else
      RPS1='$EPS1'
    fi
  fi
fi

PROMPT='%{$FG[068]%}[%~% ]$(git_custom_status)%(?.%{$fg[green]%}.%{$FG[247]%})%B$%b '
