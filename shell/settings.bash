# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
# shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# terminal color palette
# palette = "#1b1d1e:#f92672:#82b414:#fd971f:#56c2d6:#8c54fe:#465457:#ccccc6:#505354:#ff5995:#b6e354:#feed6c:#8cedff:#9e6ffe:#899ca1:#f8f8f2"
# palette = "#1b1d1e:#9e1641:#71a712:#aba550:#2621b2:#7856b4:#43a2b4:#bfbfbf:#74715d:#f72a6f:#9ee22d:#e2dc75:#3c33ff:#ae81ff:#66d9ee:#e6e5e6"
# foreground_color = "#f8f8f2"
# background_color = "#262626"
