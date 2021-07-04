;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq display-line-numbers-type t
      doom-font (font-spec :family "Cascadia Mono PL" :size 12)
      doom-theme 'doom-gruvbox-light
      doom-variable-pitch-font (font-spec :family "Avenir Next")
      org-directory "~/Documents/org"
      user-full-name "Nate Smith"
      user-mail-address "nate@theinternate.com")

(add-hook 'js2-mode-hook #'format-all-mode)
(add-hook 'typescript-mode-hook #'format-all-mode)

(add-to-list 'auto-mode-alist '("\\.als\\'" . alloy-mode))

(setq-hook! 'typescript-mode-hook +format-with-lsp nil)

(use-package! org-roam
  :after org
  :init
  (map! :leader
        :after org
        (:prefix-map ("n" . "notes")
         (:prefix ("r" . "roam")
          :desc "Toggle buffer" "b" #'org-roam-buffer-toggle
          :desc "Capture" "c" #'org-roam-capture
          :desc "Find node" "f" #'org-roam-node-find
          :desc "Insert" "i" #'org-roam-node-insert
          :desc "Random" "r" #'org-roam-node-random
          (:prefix ("d" . "dailies")
           :desc "Capture" "c" #'org-roam-dailies-capture-date
           :desc "Find date" "d" #'org-roam-dailies-find-date
           :desc "Next" "n" #'org-roam-dailies-find-next-note
           :desc "Previous" "p" #'org-roam-dailies-find-previous-note
           :desc "Today" "t" #'org-roam-dailies-find-today
           :desc "Yesterday" "y" #'org-roam-dailies-find-yesterday))))
  :commands
  (org-roam-buffer-toggle
   org-roam-capture
   org-roam-node-find
   org-roam-node-insert
   org-roam-node-random
   org-roam-dailies-capture-date
   org-roam-dailies-find-date
   org-roam-dailies-find-previous-note
   org-roam-dailies-find-today
   org-roam-dailies-find-yesterday
   org-roam-setup)
  :config
  (setq org-roam-completion-everywhere t
        org-roam-directory "~/Documents/org/roam"))
        
(after! lsp-ui
  (setq lsp-ui-sideline-show-code-actions nil))

(after! vterm
  (setq vterm-term-environment-variable "eterm-color"))

(after! cider
  (setq cider-clojure-cli-aliases "dev"))
