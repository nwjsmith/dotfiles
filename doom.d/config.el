;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Nate Smith"
      user-mail-address "nwjsmith@gmail.com"
      doom-font (font-spec :family "JetBrains Mono NL" :size 14 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "Avenir Next")
      doom-theme 'doom-gruvbox-light
      +doom-dashboard-banner-file "~/.doom.d/doom.png"
      auth-sources '("~/.netrc")
      vterm-term-environment-variable "eterm-color")

(after! f
  (setq projectile-project-search-path (f-directories "~/Code")))
