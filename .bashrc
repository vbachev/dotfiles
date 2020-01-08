# Get the path of this file and uses it for constructing relative
# paths to sourced files
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

source "$DIR/shell/prompt_command.bash"
source "$DIR/shell/settings.bash"
source "$DIR/shell/aliases.bash"
