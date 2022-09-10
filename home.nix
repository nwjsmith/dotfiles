{ pkgs, config, lib, ... }:

{
  imports = [ ./emacs.nix ./git.nix ./neovim.nix ./zsh.nix ];

  home.packages = with pkgs; [
    asciinema
    awscli2
    babashka
    curl
    fd
    gh
    jq
    neil
    ngrok
    niv
    nodejs
    pure-prompt
    (ripgrep.override { withPCRE2 = true; })
    scc
    sqlite
    yt-dlp
  ];

  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font Mono";
      size = 13;
    };
    keybindings = {
      "cmd+enter" = "launch --cwd=current";
      "cmd+shift+enter" = "new_window";
      "cmd+shift+h" = "neighboring_window left";
      "cmd+shift+j" = "neighboring_window down";
      "cmd+shift+k" = "neighboring_window up";
      "cmd+shift+l" = "neighboring_window right";
    };
    settings = {
      enabled_layouts = "tall, fat, grid, horizontal, vertical";
      confirm_os_window_close = -1;
      macos_option_as_alt = "left";
      macos_show_window_title_in = "window";
      shell_integration = "disabled";
      window_padding_width = "0 1";
      window_border_width = "0";
    };
    theme = "Gruvbox Light";
  };

  programs.gpg.enable = true;
  xdg.configFile."gnupg/gpg-agent.conf".text = ''
    enable-ssh-support
    default-cache-ttl 86400
    max-cache-ttl 86400
    pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
  '';

  xdg.configFile."shellcheckrc".source = ./shellcheckrc;
  xdg.configFile."karabiner/assets/complex_modifications/escape.json".source =
    ./config/karabiner/assets/complex_modifications/escape.json;

  home.file.".lsp/config.edn".source = ./lsp/config.edn;
  home.file.".clojure/deps.edn".source = ./clojure/deps.edn;
  home.file.".clj-kondo/config.edn".source = ./clj-kondo/config.edn;
  home.file.".clj-kondo/hooks/checking.clj".source =
    ./clj-kondo/hooks/checking.clj;
}
