{ ... }:

{
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
}
