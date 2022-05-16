autoload -U promptinit && promptinit && prompt pure

setopt interactivecomments

if test -n "${KITTY_INSTALLATION_DIR}"; then
  export KITTY_SHELL_INTEGRATION="enabled"
  autoload -Uz -- "${KITTY_INSTALLATION_DIR}/shell-integration/zsh/kitty-integration"
  kitty-integration
  unfunction kitty-integration
fi

# Sitting at the prompt sets the window title to 'cwd'
function window-title:precmd() {
  local title="$(print -P "%3~")"
  echo -ne "\033]0;${title}\007"
}

# Running a command sets window title to 'cwd | command'
function window-title:preexec() {
  local title="$(print -P "%3~ | ${1[(w)1]}")"
  echo -ne "\033]0;$title\007"
}

# Before drawing prompt or executing a command
add-zsh-hook precmd window-title:precmd
add-zsh-hook preexec window-title:preexec
