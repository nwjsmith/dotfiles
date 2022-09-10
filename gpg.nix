{ pkgs, ... }:

{
  programs.gpg.enable = true;

  xdg.configFile."gnupg/gpg-agent.conf".text = ''
    enable-ssh-support
    default-cache-ttl 86400
    max-cache-ttl 86400
    pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
  '';
}
