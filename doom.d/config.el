;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq display-line-numbers-type nil
      doom-font (font-spec :family "Cascadia Mono PL" :size 12)
      doom-theme 'doom-gruvbox-light
      doom-variable-pitch-font (font-spec :family "Inter")
      org-directory "~/Documents/org"
      user-full-name "Nate Smith"
      user-mail-address "nate@theinternate.com")

(add-hook 'js2-mode-hook #'format-all-mode)
(add-hook 'typescript-mode-hook #'format-all-mode)
(add-hook 'clojure-mode-hook #'format-all-mode)
(setq-hook! 'typescript-mode-hook +format-with-lsp nil)

(setq js-indent-level 2)
(setq typescript-indent-level 2)

(add-to-list 'auto-mode-alist '("\\.als\\'" . alloy-mode))

(use-package! blamer
  :defer 20
  :custom
  (blamer-idle-time 0.3)
  (blamer-min-offset 70)
  :custom-face
  (blamer-face ((t :foreground ,(doom-color 'base4)
                   :background nil
                   :height 90
                   :italic t)))
  :config
  (global-blamer-mode 1))

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

(use-package! html-to-hiccup
  :config
  (map! (:localleader
         (:map (clojure-mode-map clojurescript-mode-map)
          "H" #'html-to-hiccup-convert-region))))

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

(after! lispy
  (lispy-set-key-theme '(lispy c-digits))
  (define-key lispy-mode-map-lispy "[" #'lispy-brackets)
  (define-key lispy-mode-map-lispy "]" #'lispy-close-square)
  (define-key lispy-mode-map-lispy "}" #'lispy-close-curly))

(after! lsp-mode
  (setq lsp-lens-enable t
        lsp-enable-file-watchers t
        lsp-semantic-tokens-enable t
        lsp-idle-delay 0.3
        lsp-completion-no-cache t
        lsp-completion-use-last-result nil))

(after! lsp-treemacs
  (setq lsp-treemacs-error-list-current-project-only t))

(after! lsp-ui
  (setq lsp-ui-peek-fontify 'always
        lsp-ui-sideline-show-code-actions nil))

(after! vterm
  (setq vterm-term-environment-variable "eterm-color"))
