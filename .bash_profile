# Get the path of this file for constructing relative paths to sourced files
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

source "$DIR/shell/git_completion.bash"
