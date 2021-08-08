;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq display-line-numbers-type t
      doom-font (font-spec :family "Cascadia Mono PL" :size 12)
      doom-theme 'doom-gruvbox-light
      doom-variable-pitch-font (font-spec :family "Inter")
      org-directory "~/Documents/org"
      user-full-name "Nate Smith"
      user-mail-address "nate@theinternate.com")

(add-hook 'js2-mode-hook #'format-all-mode)
(add-hook 'typescript-mode-hook #'format-all-mode)

(add-to-list 'auto-mode-alist '("\\.als\\'" . alloy-mode))

(setq-hook! 'typescript-mode-hook +format-with-lsp nil)

(after! lsp-ui
  (setq lsp-ui-sideline-show-code-actions nil))

(after! vterm
  (setq vterm-term-environment-variable "eterm-color"))

(after! cider
  (setq cider-clojure-cli-aliases "dev"))

(use-package! kaocha-runner
  :config
  (map! (:localleader
         (:map (clojure-mode-map clojurescript-mode-map)
          (:prefix ("k" . "kaocha")
           "a" #'kaocha-runner-run-all-tests
           "h" #'kaocha-runner-hide-windows
           "r" #'kaocha-runner-run-tests
           "t" #'kaocha-runner-run-test-at-point
           "w" #'kaocha-runner-show-warnings)))))
