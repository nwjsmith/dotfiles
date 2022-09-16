(setq doom-theme 'doom-dracula
      doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 13)
      doom-variable-pitch-font (font-spec :family "Inter")

      comp-num-cpus (max 1 (/ (num-processors) 2))
      display-line-numbers nil)

(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)

(after! company
  ;; Only complete when asked
  (setq company-idle-delay nil))

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

(after! lsp-ui
  (setq lsp-ui-sideline-enable nil
        lsp-ui-doc-enable nil))

(after! typescript-mode
  (setq typescript-indent-level 2)
  (setq-hook! 'typescript-mode-hook +format-with-lsp nil))

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

(after! org
  (setq org-directory "~/org"
        org-agenda-files '("inbox.org" "agenda.org" "notes.org" "projects.org")
        org-capture-templates
        `(("i" "Inbox" entry  (file "inbox.org")
           ,(concat "* TODO %?\n"
                    "/Entered on/ %U"))
          ("m" "Meeting" entry (file+headline "agenda.org" "*Future*")
           ,(concat "* %? :meeting:\n"
                    "<%<%Y-%m-%d %a %H:00>>"))
          ("n" "Note" entry (file "notes.org")
           ,(concat "* Note (%a)\n"
                    "/Entered on/ %U\n"
                    "\n"
                    "%?"))
          ("p" "Project" entry (file "projects.org")
           ,(concat "* *%?* [/]\n"
                    ":PROPERTIES:\n"
                    ":COOKIE_DATA: recursive todo\n"
                    ":END:\n"
                    "** *Tasks* \n"
                    "** *Notes* \n")))
        org-agenda-hide-tags-regexp "."
        org-agenda-prefix-format
        '((agenda . " %i %-12:c%?-12t% s")
          (todo   . " ")
          (tags   . " %i %-12:c")
          (search . " %i %-12:c"))
        org-refile-targets
        '(("projects.org" :regexp . "\\(?:\\(?:Note\\|Task\\)s\\)"))
        org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WAIT(w)" "|" "DONE(d)"))
        org-log-done 'time
        org-agenda-custom-commands
        '(("g" "Get Things Done (GTD)"
           ((agenda ""
                    ((org-agenda-skip-function
                      '(org-agenda-skip-entry-if 'deadline))
                     (org-deadline-warning-days 0)))
            ("NEXT" todo
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

  (defun nwjsmith/log-todo-next-creation-date (&rest ignore)
    "Log NEXT creation time in the property drawer under the key 'ACTIVATED'"
    (when (and (string= (org-get-todo-state) "NEXT")
               (not (org-entry-get nil "ACTIVATED")))
      (org-entry-put nil "ACTIVATED" (format-time-string "[%Y-%m-%d]"))))

  (add-hook 'org-after-todo-state-change-hook #'nwjsmith/log-todo-next-creation-date))

(after! evil-org
  (remove-hook 'org-tab-first-hook #'+org-cycle-only-current-subtree-h))
