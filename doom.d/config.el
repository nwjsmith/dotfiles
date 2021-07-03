;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq display-line-numbers-type t
      doom-font (font-spec :family "Cascadia Mono PL" :size 12)
      doom-theme 'doom-gruvbox-light
      doom-variable-pitch-font (font-spec :family "Avenir Next")
      org-directory "~/Documents/org"
      org-roam-directory "~/Documents/org/roam"
      user-full-name "Nate Smith"
      user-mail-address "nate@theinternate.com")

(add-hook 'js2-mode-hook #'format-all-mode)
(add-hook 'typescript-mode-hook #'format-all-mode)

(setq-hook! 'typescript-mode-hook +format-with-lsp nil)

(after! lsp-ui
  (setq lsp-ui-sideline-show-code-actions nil))

(after! vterm
  (setq vterm-term-environment-variable "eterm-color"))

(after! cider
  (setq cider-clojure-cli-aliases "dev"))
