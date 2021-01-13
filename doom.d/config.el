;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Nate Smith"
      user-mail-address "nwjsmith@gmail.com"
      doom-font (font-spec :family "JetBrains Mono NL" :size 14 :weight 'medium)
      doom-variable-pitch-font (font-spec :family "Avenir Next")
      doom-theme 'doom-gruvbox-light
      +doom-dashboard-banner-file "~/.doom.d/doom.png"
      auth-sources '("~/.netrc")
      orb-insert-interface 'ivy-bibtex
      org-directory "~/Library/Mobile Documents/com~apple~CloudDocs/Org"
      org-roam-directory (concat org-directory "/Roam")
      bibtex-completion-bibliography (concat org-directory "/bibliography.bib"))

(use-package! org-roam-bibtex
  :after org-roam
  :hook (org-roam-mode . org-roam-bibtex-mode))

(after! org-pomodoro
  (setq org-pomodoro-length 30
        org-pomodoro-short-break-length 5
        org-pomodoro-long-break-frequency 8))

(after! vterm
  (setq vterm-term-environment-variable "eterm-color"))
