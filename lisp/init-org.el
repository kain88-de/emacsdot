(use-package org
  :defer t)

(defun max/org-mode-hook ()
  (setq save-place nil)
  (flyspell-mode))

(add-hook 'org-mode-hook 'max/org-mode-hook)
; not needed when global-font-lock-mode is on
(add-hook 'org-mode-hook 'turn-on-font-lock)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

(evil-leader/set-key "oa" 'org-agenda)
(evil-leader/set-key "ol" 'org-store-link)
(evil-leader/set-key "oe" 'org-export-dispatch)

(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("STARTED" . "yellow")
        ("CANCELED" . (:foreground "blue" :weight bold))))

(custom-set-variables
 '(org-agenda-files (quote ("~/org/organizer.org")))
 '(org-agenda-ndays 7)
 '(org-deadline-warning-days 14)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-reverse-note-order t))

(setq org-src-fontify-natively t)
(setq org-export-backends (quote (ascii beamer html icalendar latex md)))

(defun org ()
  (interactive)
  (find-file "~/org/organizer.org"))

(defun notes ()
  (interactive)
  (find-file "~/org/notes.org"))
(setq org-default-notes-file "~/org/notes.org")
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "" "Tasks")
         "* TODO %? \n %t\n %a")
        ("j" "Journal" entry (file+headline "" "Journal")
         "* %?\nEntered on %U\n %i\n %a")))

(provide 'init-org)
