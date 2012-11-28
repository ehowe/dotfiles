#!/usr/bin/env sh

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

## set PATH so it includes user's private bin if it exists
if [[ -d "$HOME/bin" ]] ; then
    PATH="$HOME/bin:$PATH"
fi

if [[ -d "$HOME/.files/bin" ]] ; then
    PATH="$HOME/.files/bin:$PATH"
fi

export PATH="$HOME/sbin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$PATH:/usr/local/git/bin:/usr/local/sbin"

# Ruby tweaks
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_FREE_MIN=500000
export RUBY_HEAP_MIN_SLOTS=40000
export HISTFILESIZE=9999
export HISTSIZE=9999

## Editor
if [[ -s $(which mvim) ]]; then
  export EDITOR=mvim
else
  export EDITOR=vim
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Ruby tweaks
if [[ -z $(ruby -W0 -e "print RUBY_VERSION" | grep 2\.) ]]; then
  export RUBY_FREE_MIN=500000
  export RUBY_HEAP_MIN_SLOTS=40000
else
  export RUBY_GC_MALLOC_LIMIT=1000000000
  export RUBY_GC_HEAP_FREE_SLOTS=1000000000
  export RUBY_GC_HEAP_FREE_SLOTS=500000
fi


export HISTFILESIZE=9999
export HISTSIZE=9999

source "$HOME/.alias"
if [ -f "$HOME/.homebrew.profile" ]; then
  source $HOME/.homebrew.profile
fi

if [[ -n "${SSH_CONNECTION+x}" ]]; then
  export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \H:\W \$(parse_git_branch)\$\[\033[00m\] "
else
  export PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$(parse_git_branch)\$\[\033[00m\] "
fi

alias gohome="ssh eugene@xtreme-computers.dyndns.org -p2222"
