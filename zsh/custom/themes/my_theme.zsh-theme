### Segments of the prompt, default order declaration

typeset -aHg AGNOSTER_PROMPT_SEGMENTS=(
    prompt_status
    prompt_context
    prompt_virtualenv
    prompt_dir
    prompt_git
    prompt_end
)

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts
WHITE="#c6c6c6",
GREY="#303030"
VIOLET="#d183e8"
BLACK='#080808'
CURRENT_BG='NONE'
SUPER_USER_COLOUR='#970000'
USER_COLOUR='#5d009f'
if [[ -z "$PRIMARY_FG" ]]; then
	PRIMARY_FG=$VIOLET
fi

# Characters
SEGMENT_SEPARATOR=""
PLUSMINUS="󰃻"
BRANCH="󰘬"
DETACHED="\u27a6"
ERROR=" "
SUPER_USER=" "
GEAR="\u2699"
CUSTOM_PROMPT="   󱞩  "

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    print -n "%{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%}"
  else
    print -n "%{$bg%}%{$fg%}"
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && print -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    print -n "%{%k%}"
  fi
  print -n "%{%f%}"
  # print -n "$CUSTOM_PROMPT"
  CURRENT_BG=''
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CONNECTION" ]]; then
    prompt_segment NONE $PRIMARY_FG ""
    prompt_segment $PRIMARY_FG $USER_COLOUR " %(!.%{%F{$SUPER_USER_COLOUR}%}.)$user@%m "
  fi
  PROMPT='%{%f%b%k%}$(prompt_agnoster_main) '
}

# Git: branch/detached head, dirty status
prompt_git() {
  local color ref
  is_dirty() {
    test -n "$(git status --porcelain --ignore-submodules)"
  }
  ref="$vcs_info_msg_0_"
  if [[ -n "$ref" ]]; then
    if is_dirty; then
      color=yellow
      ref="${ref} $PLUSMINUS "
    else
      color=green
      ref="${ref} "
    fi
    if [[ "${ref/.../}" == "$ref" ]]; then
      ref="$BRANCH $ref"
    else
      ref="$DETACHED ${ref/.../}"
    fi
    prompt_segment $color black
    print -n " $ref"
  fi
}

# Dir: current working directory
prompt_dir() {
  prompt_segment $BLACK $WHITE ' %~ '
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%} $RETVAL $ERROR"
  [[ $UID -eq 0 ]] && symbols+="%{%F{$SUPER_USER_COLOUR}%}$SUPER_USER"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}$GEAR"

  [[ -n "$symbols" ]] && prompt_segment defualt default " $symbols "
}

# Display current virtual environment
prompt_virtualenv() {
  if [[ -n $VIRTUAL_ENV ]]; then
    color='#035909'
    prompt_segment $color $PRIMARY_FG
    print -Pn " $(basename $VIRTUAL_ENV) "
  fi
}

## Main prompt
prompt_agnoster_main() {
  RETVAL=$?
  CURRENT_BG='NONE'
  for prompt_segment in "${AGNOSTER_PROMPT_SEGMENTS[@]}"; do
    [[ -n $prompt_segment ]] && $prompt_segment
  done
}

prompt_agnoster_precmd() {
  vcs_info
  RPROMPT="%{%F{$BLACK}%K{$PRIMARY_FG}%} $(date +'%A, %B %d, %Y %I:%M:%S %p') %{%f%b%k%}%{%F{$PRIMARY_FG}%}"
  PROMPT='%{%f%b%k%}$(prompt_agnoster_main)
  $CUSTOM_PROMPT'
}

prompt_agnoster_setup() {
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  prompt_opts=(cr subst percent)

  add-zsh-hook precmd prompt_agnoster_precmd

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' check-for-changes false
  zstyle ':vcs_info:git*' formats '%b'
  zstyle ':vcs_info:git*' actionformats '%b (%a)'
}

prompt_agnoster_setup "$@"
