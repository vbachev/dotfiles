# Command that Bash executes just before displaying a prompt
export PROMPT_COMMAND=set_prompt

# Call this function whenever a simple command is executed
trap 'set_timer' DEBUG

set_timer() {
  TIMER=${TIMER:-$SECONDS}
}

set_prompt() {
  # Capture exit code of last command
  local EXIT_CODE=$?

  #----------------------------------------------------------------------------#
  # Bash text colour specification:  \e[<STYLE>;<COLOUR>m
  # (Note: \e = \033 (oct) = \x1b (hex) = 27 (dec) = "Escape")
  # Styles:  0=normal, 1=bold, 2=dimmed, 4=underlined, 7=highlighted
  # Colours: 31=red, 32=green, 33=yellow, 34=blue, 35=purple, 36=cyan, 37=white
  #----------------------------------------------------------------------------#

  # show folder name in iTerm2 tab titles
  if [ $ITERM_SESSION_ID ]; then
    echo -ne "\033]0;${PWD##*/}\007"
  fi

  # Capture the duration of last command; e.g. " (~12s)"
  local DURATION=$(($SECONDS - $TIMER))
  if [ "$DURATION" -ne 0 ]; then
    DURATION=" \[\e[2;31m\](~${DURATION}s)\[\e[m\]"
  else
    DURATION=""
  fi
  unset TIMER

  # e.g. "user@machine"
  local USER="\[\e[36m\]\u\[\e[m\]@\[\e[34m\]\h\[\e[m\]"

  # e.g. "~/foo/bar"
  local DIR="\[\e[32m\]\w\[\e[m\]"

  # e.g. " (some_git_branch_name)"
  local BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
  [[ "$BRANCH" ]] && BRANCH=" \[\e[33m\](${BRANCH})\[\e[m\]"

  local PROMPT="\[\e[32m\]⮑  \[\e[m\]"
  [[ "$EXIT_CODE" -ne 0 ]] && PROMPT="\[\e[31m\]⮑  \[\e[m\]"

  PS1="\n${USER}: ${DIR}${BRANCH}${DURATION}\n${PROMPT}"
  PS2=$PROMPT
}
