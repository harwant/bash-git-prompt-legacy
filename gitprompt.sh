#!/bin/bash

# Git prompt
COLOR_RED="\033[02;31m"
COLOR_GREEN="\033[02;32m"
COLOR_YELLOW="\033[02;33m"
COLOR_BLUE="\033[02;34m"
COLOR_MAGENTA="\033[02;35m"
COLOR_CYAN="\033[02;36m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_WHITE="\033[02;37m"
COLOR_RESET="\033[00m"

function git_color {
  local git_status="$(git status 2> /dev/null)"

  if [[ $git_status =~ "Changed but not updated" ]]; then
    echo -e $COLOR_RED
  elif [[ $git_status =~ "Changes to be committed" ]]; then
    echo -e $COLOR_MAGENTA
  elif [[ $git_status =~ "Untracked files" ]]; then
    echo -e $COLOR_CYAN
  elif [[ $git_status =~ "Your branch is ahead of" ]]; then
    echo -e $COLOR_YELLOW
  elif [[ $git_status =~ "nothing to commit" ]]; then
    echo -e $COLOR_GREEN
  #else
  #  echo -e $COLOR_OCHRE
  fi
}

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "($branch)"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "($commit)"
  fi
}

case $GITPROMPT_HOSTNAME_COLOR in
    'COLOR_RED')
        GITPROMPT_HOSTNAME_COLOR=$COLOR_RED
        ;;

    'COLOR_YELLOW')
        GITPROMPT_HOSTNAME_COLOR=$COLOR_YELLOW
        ;;

    'COLOR_GREEN')
        GITPROMPT_HOSTNAME_COLOR=$COLOR_GREEN
        ;;

    *)
        GITPROMPT_HOSTNAME_COLOR=$COLOR_WHITE
        ;;
esac

PS1="\[$GITPROMPT_HOSTNAME_COLOR\]\u@\h:\[$COLOR_BLUE\]\w"
PS1+="\[\$(git_color)\]"
PS1+="\$(git_branch)"
PS1+="\[$COLOR_BLUE\]\$\[$COLOR_RESET\] "
export PS1
