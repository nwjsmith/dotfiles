function pyenv() {
  eval "$(pyenv init -)"
  pyenv "$@"
}
