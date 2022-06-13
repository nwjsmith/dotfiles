(setq doom-theme 'doom-gruvbox-light)
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 13))
(setq doom-variable-pitch-font (font-spec :family "Inter"))

;; TypeScript's default indent level is 4
(setq typescript-indent-level 2)

;; Only complete when asked
(setq company-idle-delay nil)

;; Files
(setq org-directory "~/org")
(setq org-agenda-files '("inbox.org" "agenda.org"))

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
                  "%?"))))

;; Cycle recursively
(after! evil-org
  (remove-hook 'org-tab-first-hook #'+org-cycle-only-current-subtree-h))

(setq org-agenda-hide-tags-regexp ".")

(setq org-agenda-prefix-format
      '((agenda . " %i %-12:c%?-12t% s")
        (todo   . " ")
        (tags   . " %i %-12:c")
        (search . " %i %-12:c")))

(setq org-refile-targets
      '(("projects.org" :regexp . "\\(?:\\(?:Note\\|Task\\)s\\)")))

(setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "WAIT(w)" "|" "DONE(d)")))

(defun log-todo-next-creation-date (&rest ignore)
  "Log NEXT creation time in the property drawer under the key 'ACTIVATED'"
  (when (and (string= (org-get-todo-state) "NEXT")
             (not (org-entry-get nil "ACTIVATED")))
    (org-entry-put nil "ACTIVATED" (format-time-string "[%Y-%m-%d]"))))

(add-hook 'org-after-todo-state-change-hook #'log-todo-next-creation-date)

;; https://www.labri.fr/perso/nrougier/GTD/index.html#org71c4c4c
