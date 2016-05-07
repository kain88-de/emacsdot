(use-package org
  :ensure t
  :defer t
  :config
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; Orgmode as a Day planer settings ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (global-set-key (kbd "C-c a") 'org-agenda)

  ;; file to save todo items
  (setq org-agenda-files (quote ("~/org/organizer.org")))
  (setq org-agenda-window-setup (quote current-window))

  (setq org-todo-keyword-faces
        '(("TODO" . org-warning) ("STARTED" . "yellow")
          ("CANCELED" . (:foreground "blue" :weight bold))))

  (custom-set-variables
   '(org-agenda-ndays 7)
   '(org-deadline-warning-days 14)
   '(org-agenda-show-all-dates t)
   '(org-agenda-skip-deadline-if-done t)
   '(org-agenda-skip-scheduled-if-done t)
   '(org-agenda-start-on-weekday nil)
   '(org-reverse-note-order t))

  ;; capture todo items using C-c c t
  (define-key global-map (kbd "C-c o t") 'org-capture)
  (setq org-capture-templates
        '(("t" "TODO" entry (file+headline "/home/max/org/organizer.org" "Tasks")
           "* TODO %?")))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; General Org Mode Settings  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (calc . t)
     (ipython . t)
     (python . t)))

  (use-package ob-ipython
    :ensure t)


  (defun max/org-mode-hook ()
    (setq save-place nil)
    (flyspell-mode))

  (add-hook 'org-mode-hook 'max/org-mode-hook)
  ; not needed when global-font-lock-mode is on
  (add-hook 'org-mode-hook 'turn-on-font-lock)

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

    (add-to-list 'org-latex-classes '("revtex4-1"
                                      "\\documentclass{revtex4-1}
                                      [NO-DEFAULT-PACKAGES]
                                      [PACKAGES]
                                      [EXTRA]"
                                      ("\\section{%s}" . "\\section*{%s}")
                                      ("\\subsection{%s}" . "\\subsection*{%s}")
                                      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                      ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                      ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

    (setq org-latex-pdf-process
          '("latexmk -shell-escape -interaction=nonstopmode -pdf -f %f"
            "latexmk -c"))))


(defun org ()
  (interactive)
  (find-file "~/org/organizer.org"))

;; start with orgmode-notes
(setq initial-buffer-choice "/home/max/org/organizer.org")

(provide 'init-org)
