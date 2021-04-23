;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Nate Smith"
      user-mail-address "nate.smith@hey.com")

(setq doom-theme 'doom-gruvbox-light
      doom-font (font-spec :family "Rec Mono Linear" :size 12)
      doom-variable-pitch-font (font-spec :family "Avenir Next"))

(setq display-line-numbers-type t)

(setq-hook! 'typescript-mode-hook +format-with-lsp nil)
(add-hook 'js2-mode-hook #'format-all-mode)
(add-hook 'typescript-mode-hook #'format-all-mode)

(after! vterm
  (setq vterm-term-environment-variable "eterm-color"))
