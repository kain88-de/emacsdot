(use-package org
  :ensure t
  :defer t
  :config
  (defun max/org-mode-hook ()
    (setq save-place nil)
    (flyspell-mode))

  (add-hook 'org-mode-hook 'max/org-mode-hook)
                                        ; not needed when global-font-lock-mode is on
  (add-hook 'org-mode-hook 'turn-on-font-lock)
  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-ca" 'org-agenda)

  (defhydra org-hydra (global-map "C-c o" :color teal)
    ("a" org-agenda)
    ("l" org-store-link)
    ("e" org-export-dispatch))

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
  (setq org-confirm-babel-evaluate nil)

  (setq org-latex-listings 't)
  (use-package ox-latex
    :defer t
    :config

    (add-to-list 'org-latex-packages-alist '("" "listings"))
    (add-to-list 'org-latex-packages-alist '("" "color"))

    (add-to-list 'org-latex-classes
                 '("complexes-style"
                   "\\documentclass{book}
                 [DEFAULT-PACKAGES]
                 [PACKAGES]
                 [EXTRA]"
                   ("\\chapter{%s}" . "\\chapter{%s}")
                   ("\\section{%s}" . "\\section{%s}")
                   ("\\subsection{%s}" . "\\subsection{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection{%s}")
                   ("\\paragraph{%s}" . "\\paragraph{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph{%s}")))

    (setq org-latex-pdf-process
          '("latexmk -shell-escape -interaction=nonstopmode -pdf -f %f"
            "latexmk -c"))))

(use-package ob-ipython
  :ensure t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (calc . t)
   (ipython . t)
   (python . t)))

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
