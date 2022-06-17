(setq doom-theme 'doom-gruvbox-light)
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 13))
(setq doom-variable-pitch-font (font-spec :family "Inter"))

(after! typescript-mode
  ;; TypeScript's default indent level is 4
  (setq typescript-indent-level 2))

(after! company
  ;; Only complete when asked
  (setq company-idle-delay nil))

(after! org
  (setq org-directory "~/org")
  (setq org-agenda-files '("inbox.org" "agenda.org" "notes.org" "projects.org"))

  (setq org-capture-templates
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
                    "** *Notes* \n"))))

  (setq org-agenda-hide-tags-regexp ".")

  (setq org-agenda-prefix-format
        '((agenda . " %i %-12:c%?-12t% s")
          (todo   . " ")
          (tags   . " %i %-12:c")
          (search . " %i %-12:c")))

  (setq org-refile-targets
        '(("projects.org" :regexp . "\\(?:\\(?:Note\\|Task\\)s\\)")))

  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WAIT(w)" "|" "DONE(d)")))

  (defun log-todo-next-creation-date (&rest ignore)
    "Log NEXT creation time in the property drawer under the key 'ACTIVATED'"
    (when (and (string= (org-get-todo-state) "NEXT")
               (not (org-entry-get nil "ACTIVATED")))
      (org-entry-put nil "ACTIVATED" (format-time-string "[%Y-%m-%d]"))))

  (add-hook 'org-after-todo-state-change-hook #'log-todo-next-creation-date)

  (setq org-agenda-custom-commands
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
                  ((org-agenda-overriding-header "\nCompleted today\n"))))))))

(after! evil-org
  (remove-hook 'org-tab-first-hook #'+org-cycle-only-current-subtree-h))
