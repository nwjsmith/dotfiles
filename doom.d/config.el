(setq auth-sources '("~/.authinfo.gpg")
      comp-num-cpus (max 1 (/ (num-processors) 2))
      display-line-numbers-type nil
      doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 13)
      doom-theme 'doom-gruvbox-light
      doom-variable-pitch-font (font-spec :family "Inter")
      fancy-splash-image (concat doom-user-dir "doom.svg"))

(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

(after! company
  ;; Only complete when asked
  (setq company-idle-delay nil))

(after! cider
  (setq cider-clojure-cli-aliases "dev"
        cider-save-file-on-load nil
        cider-repl-pop-to-buffer-on-connect nil))

(after! clj-refactor
  (setq cljr-warn-on-eval nil
        cljr-add-ns-to-blank-clj-files nil
        cljr-eagerly-build-asts-on-startup nil))

(after! clojure-mode
  (setq clojure-thread-all-but-last t))

(after! eglot
  (dolist (server-program '((java-mode "jdt-language-server")
                            (nix-mode "nil")))
    (add-to-list 'eglot-server-programs server-program)))

(use-package! evil-cleverparens
  :init (setq evil-cleverparens-use-s-and-S nil)
  :hook ((lisp-mode . evil-cleverparens-mode)
         (emacs-lisp-mode . evil-cleverparens-mode)
         (ielm-mode . evil-cleverparens-mode)
         (scheme-mode . evil-cleverparens-mode)
         (racket-mode . evil-cleverparens-mode)
         (hy-mode . evil-cleverparens-mode)
         (lfe-mode . evil-cleverparens-mode)
         (dune-mode . evil-cleverparens-mode)
         (clojure-mode . evil-cleverparens-mode)
         (fennel-mode . evil-cleverparens-mode)))

(defun nwjsmith/org-save-all-agenda-buffers ()
  "Save `org-agenda-files' buffers without user confirmation.
See also `org-save-all-org-buffers'"
  (interactive)
  (message "Saving all Org agenda buffers... done")
  (save-some-buffers t (lambda () (and (member (buffer-file-name) org-agenda-files) t)))
  (message "Saving all Org agenda buffers... done"))

(use-package! org
  :init
  (setq org-directory (expand-file-name "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents"))
  :config
  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "WAIT(w@)" "|" "DONE(d)" "KILL(k@)"))
        org-log-done 'time
        org-agenda-files '("inbox.org" "someday.org" "projects.org" "schedule.org")
        org-capture-templates '(("i" "Inbox" entry (file "inbox.org")
                                 "* TODO %?")
                                ("m" "Meeting" entry (file "schedule.org")
                                 "* %? :meeting:\n<%<%Y-%m-%d %a %H:00+00:25>>"))
        org-agenda-custom-commands
        '(("g" "Get Things Done (GTD)"
           ((agenda ""
                    ((org-agenda-skip-function
                      '(org-agenda-skip-entry-if 'deadline))
                     (org-deadline-warning-days 0)))
            (todo "NEXT"
                  ((org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'deadline))
                   (org-agenda-prefix-format "  %i %-12:c [%e] ")
                   (org-agenda-overriding-header "\nTasks\n")))
            (agenda nil
                    ((org-agenda-entry-types '(:deadline))
                     (org-agenda-format-date "")
                     (org-deadline-warning-days 7)
                     (org-agenda-skip-function
                      '(org-agenda-skip-entry-if 'notregexp "\\* NEXT"))
                     (org-agenda-overriding-header "\nDeadlines")))
            (tags-todo "inbox"
                       ((org-agenda-prefix-format "  %?-12t% s")
                        (org-agenda-overriding-header "\nInbox\n")))
            (tags "CLOSED>=\"<today>\""
                  ((org-agenda-overriding-header "\nCompleted today\n")))))))
  (advice-add 'org-refile :after
              (lambda (&rest _)
                (nwjsmith/org-save-all-agenda-buffers))))

(use-package! org-roam
  :init
  (setq org-roam-directory (concat org-directory "/roam")))

(after! typescript-mode
  (setq typescript-indent-level 2)
  (setq-hook! 'typescript-mode-hook +format-with-lsp nil))

(after! projectile
  (setq projectile-project-search-path '(("~/Code" . 2))))

(use-package! jest-test-mode
  :hook (typescript-mode js-mode typescript-tsx-mode)
  :config
  (setq jest-test-command-string "yarn %s jest %s %s")
  (set-popup-rule! "^\\*\\(rspec-\\)?compilation" :size 0.3 :ttl nil :select t)
  (map! (:localleader
         (:map (typescript-mode-map js-mode-map typescript-tsx-mode-map)
               (:prefix ("t" . "jest")
                        "a" #'jest-test-run-all-tests
                        "t" #'jest-test-run-at-point
                        "f" #'jest-test-run
                        "r" #'jest-test-rerun-test)))))

(set-formatter! 'alejandra "alejandra --quiet" :modes '(nix-mode))
