#!/bin/bash

#  ---------------------------------------------------------------------------
#  Description:  This file holds all my BASH configurations and aliases
#  ---------------------------------------------------------------------------
#
#  Sections:
#  1.  Environment Configuration
#  2.  Make Terminal Better (remapping defaults and adding functionality)
#  3.  File and Folder Management
#  4.  Searching
#  5.  Process Management
#  6.  Networking
#  7.  System Operations & Information
#  8.  Web Development
#  9.  Reminders & Notes
#
#  ---------------------------------------------------------------------------

#   -------------------------------
#   1. ENVIRONMENT CONFIGURATION
#   -------------------------------

#   Change Prompt
#   ------------------------------------------------------------
    export BASH_SILENCE_DEPRECATION_WARNING=1

    parse_git_branch() {
        git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/ '
    }

    [ "$SHELL" == "/bin/bash" ] && export PS1="[\[\033[36m\]\u@\h \[\033[31m\]\w\[\033[00m\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\] \D{%F %T}]\n$ "
    [ "$SHELL" == "/bin/zsh" ] && export PS1="%D %T %~ %n $ "

#   Turn off bell sound
#   ------------------------------------------------------------

    bind 'set bell-style none'

#   Pretty Colors
#   ------------------------------------------------------------
    export CLICOLOR=1
    export LSCOLORS=exfxbxdxcxegedabagacad

    # 1. directory
    # 2. symbolic link – special kind of file that contains a reference to another file or directory.
    # 3. socket – special kind of file used for inter-process communication.
    # 4. pipe – special file that connects the output of one process to the input of another.
    # 5. executable
    # 6. block special – a kind of device file.
    # 7. character special – a kind of device file.
    # 8. executable with setuid bit set (setuid is a short for set user ID upon execution).
    # 9. executable with setgid bit set (setgid is a short for set group ID upon execution).
    # 10. directory writable to others, with sticky bit – only the owner can rename or delete files.
    # 11. directory writable to others, without sticky bit – any user with write and execution permissions can rename or delete files.

    # a black
    # b red
    # c green
    # d brown
    # e blue
    # f magenta
    # g cyan
    # h light grey
    # x default color

#   Bash Completion
#   ------------------------------------------------------------ 
    [ -f $(brew --prefix)/etc/bash_completion ] && . $(brew --prefix)/etc/bash_completion
    [ -f ~/.config/exercism/exercism_completion.bash ] && . ~/.config/exercism/exercism_completion.bash

#   Set Paths
#   ------------------------------------------------------------
    export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
    export PATH=/usr/local/share/npm/bin:$PATH

#   Set Default Editor
#   ------------------------------------------------------------
    export EDITOR=/usr/bin/vim

#   Set default blocksize for ls, df, du
#   ------------------------------------------------------------
    export BLOCKSIZE=1k

#   -----------------------------
#   2. ALIASES
#   -----------------------------

alias ls='ls -l'
alias ll='ls -la'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels

alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings

alias vbp='vim ~/.bash_profile'             # Edit the local .bash_profile
alias dot='cd ~/codes/dotfiles'             # Go into my dotfiles folder

#   Secure some "dangerous" commands
#   ------------------------------------------------------------

alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

#   Git specific aliases
#   ------------------------------------------------------------
alias g='git'
alias gc='git commit'
alias co='git checkout'
alias st='git status'
alias diff='git diff'
alias ga='git add'
alias gp='git add --patch'

#   Functions
#   ------------------------------------------------------------

cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
mcd() { mkdir -p $1; cd $1;}                # Go into directory after creation
gadd() { git add $@; git status;}         # Show git status after adding something

#   -----------------------------
#   9. REMINDERS & NOTES
#   -----------------------------

# Add the next line to .bash_profile at customer computer and adapt to dotfiles location
# [ -f $HOME/code/dotfiles/.bash_profile ] && . $HOME/code/dotfiles/.bash_profile
