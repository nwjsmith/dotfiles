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

      foreground = "#000000";
      background = "#f7f7f7";
      selection_foreground = "#000000";
      selection_background = "#bfdbfe";
      cursor = "#007acc";
      cursor_text_color = "#bfdbfe";
      url_color = "#325cc0";
      color0 = "#000000";
      color8 = "#777777";
      color1 = "#aa3731";
      color9 = "#f05050";
      color2 = "#448c37";
      color10 = "#60cb00";
      color3 = "#cb9000";
      color11 = "#ffbc5d";
      color4 = "#325cc0";
      color12 = "#007acc";
      color5 = "#7a3e9d";
      color13 = "#e64ce6";
      color6 = "#0083b2";
      color14 = "#00aacb";
      color7 = "#f7f7f7";
      color15 = "#f7f7f7";
      active_border_color = "#777777";
      inactive_border_color = "#cccccc";
      bell_border_color = "#e97e57";
      active_tab_foreground = "#000000";
      active_tab_background = "#f7f7f7";
      inactive_tab_foreground = "#444444";
      inactive_tab_background = "#dedede";
    };
  };
}
