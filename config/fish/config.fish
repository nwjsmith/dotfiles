set -x FISH_HOME "$HOME/.config/fish"

if [ -r "$HOME/.config.fish" ]
  source "$HOME/.config.fish"
end

source "$FISH_HOME/exports.fish"
source "$FISH_HOME/aliases.fish"
source "$FISH_HOME/solarized.fish"
