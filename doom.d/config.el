;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq company-idle-delay nil
      display-line-numbers-type nil
      doom-font (font-spec :family "Cascadia Mono PL" :size 12)
      doom-theme 'doom-gruvbox-light
      doom-variable-pitch-font (font-spec :family "Inter")
      user-full-name "Nate Smith"
      user-mail-address "nate@theinternate.com")

(use-package! jest
  :commands (jest-popup)
  :custom
  (jest-executable "yarn test")
  :init
  (pushnew! evil-collection-mode-list 'jest-mode)
  (pushnew! evil-normal-state-modes 'jest-mode))

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

(after! cider
  (setq cider-clojure-cli-aliases "dev"
        cider-save-file-on-load nil
        cider-font-lock-dynamically nil
        cider-eldoc-display-for-symbol-at-point nil
        cider-prompt-for-symbol nil))

(after! clj-refactor
  (setq cljr-warn-on-eval nil
        cljr-add-ns-to-blank-clj-files nil
        cljr-eagerly-build-asts-on-startup nil)
  (set-lookup-handlers! 'clj-refactor-mode nil))

(after! clojure-mode
  (setq clojure-thread-all-but-last t))
(add-hook 'clojure-mode-hook #'format-all-mode)

(add-hook 'js2-mode-hook #'format-all-mode)

(after! lispy
  (lispy-set-key-theme '(lispy c-digits))
  (define-key lispy-mode-map-lispy "[" #'lispy-brackets)
  (define-key lispy-mode-map-lispy "]" #'lispy-close-square)
  (define-key lispy-mode-map-lispy "}" #'lispy-close-curly))

(after! lsp-ui
  (setq lsp-ui-sideline-enable nil
        lsp-ui-doc-enable nil))

(after! typescript-mode
  (setq typescript-indent-level 2))
(add-hook 'typescript-mode-hook #'format-all-mode)
(setq-hook! 'typescript-mode-hook +format-with-lsp nil)

(after! vterm
  (setq vterm-term-environment-variable "eterm-color"))
