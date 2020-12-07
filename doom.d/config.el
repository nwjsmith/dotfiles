;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Nate Smith"
      user-mail-address "nwjsmith@gmail.com"
      doom-font (font-spec :family "JetBrains Mono NL" :size 14 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "Avenir Next")
      doom-theme 'doom-gruvbox-light
      +doom-dashboard-banner-file "~/.doom.d/doom.png"
      auth-sources '("~/.netrc")
      org-directory "~/Library/Mobile Documents/com~apple~CloudDocs/Org"
      org-roam-directory (concat org-directory "/Roam"))

(after! org-pomodoro
  (setq org-pomodoro-length 30
        org-pomodoro-short-break-length 5
        org-pomodoro-long-break-frequency 8))
