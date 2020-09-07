#  ---------------------------------------------------------------------------
#
#  Description:  This file holds all my BASH configurations and aliases
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

    export PS1="[\[\033[36m\]\u@\h \[\033[31m\]\w\[\033[00m\]\[\033[32m\]\$(parse_git_branch)\[\033[00m\] \D{%F %T}]\n$ "


#    export PS1="%D %T %~  %n $(parse_git_branch) $ "
#    export PS1='[\u@\h \W] \D{%F %T}\n\$ '

#   Pretty Colors
#   ------------------------------------------------------------
    export CLICOLOR=1
    LSCOLORS=exfxbxdxcxegedabagacad

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
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi
    
    if [ -f ~/.config/exercism/exercism_completion.bash ]; then
      . ~/.config/exercism/exercism_completion.bash
    fi

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

#   Add color to terminal
#   ------------------------------------------------------------
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad



#   -----------------------------
#   2. ALIASES
#   -----------------------------

alias ll='ls -la'
cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings

alias vbp='vim ~/.bash_profile'


#   Git specific aliases
#   ------------------------------------------------------------
alias g='git'
alias gc='git commit'
alias st='git status'
alias ga='git add'
alias gp='git add --patch'


