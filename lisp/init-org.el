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
        '(("TODO" . org-warning) ("WAITING" . "yellow")
          ("CANCELED" . (:foreground "blue" :weight bold))))

  (setq org-todo-keywords
        '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d!)" "CANCELED(c@)")))

  (custom-set-variables
   '(org-agenda-ndays 7)
   '(org-deadline-warning-days 14)
   '(org-agenda-show-all-dates t)
   '(org-agenda-skip-deadline-if-done t)
   '(org-agenda-skip-scheduled-if-done t)
   '(org-agenda-start-on-weekday nil)
   '(org-reverse-note-order t))

  ;; bound in a hydra
  ;; (define-key global-map (kbd "C-c o t") 'org-capture)
  (setq org-capture-templates
        '(("p" "PRIVAT-TODO" entry (file+headline "/home/max/org/organizer.org" "Private")
           "* TODO %? %^g\n %u")
          ("w" "WORK-TODO" entry (file+headline "/home/max/org/organizer.org" "Work")
           "* TODO %? %^g\n %u")
          ("o" "FOSS-TODO" entry (file+headline "/home/max/org/organizer.org" "Foss")
           "* TODO %? %^g\n %u")))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; General Org Mode Settings  ;;
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (use-package ob-ipython
    :ensure t)

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (calc . t)
     (ipython . t)
     (python . t)))

  (defun max/org-mode-hook ()
    (setq save-place nil)
    (flyspell-mode))

  (add-hook 'org-mode-hook 'max/org-mode-hook)
  ; not needed when global-font-lock-mode is on
  (add-hook 'org-mode-hook 'turn-on-font-lock)

  (setq org-src-fontify-natively t)
  (setq org-export-backends (quote (ascii beamer html icalendar latex md)))
  (setq org-confirm-babel-evaluate nil)

  ; setup org publish
  (setq org-export-async-debug t)
  (setq org-publish-project-alist
        '(("orgfiles"
           :base-directory "~/foss/blog/org"
           :base-extension "org"
           :publishing-directory "~/foss/blog/content/posts"
           :publishing-function org-md-publish-to-md
           :section-number nil
           :with-toc nil)))

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

;; (use-package org-journal
;;   :ensure t
;;   :config
;;   (setq org-journal-dir "/mnt/science/Journal/")
;;   (setq org-journal-file-format "%Y-%m-%d.org"))


;; start with orgmode-notes
(setq initial-buffer-choice "/home/max/org/organizer.org")

(provide 'init-org)
