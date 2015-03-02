(use-package rainbow-delimiters
             :ensure t)

(use-package whitespace
             :ensure t)

(defun max-save-and-build ()
  "Save and build projects with projectile"
  (interactive)
  (projectile-save-project-buffers)
  (projectile-compile-project t))

(defun max/bury-compile-buffer-if-successful (buffer string)
  "Bury a compilation buffer if succeeds without warnings "
  (if (and
       (string-match "compilation" (buffer-name buffer))
       (string-match "finished" string)
       (not
        (with-current-buffer buffer
          (search-forward "warning" nil t))))
      (run-with-timer .2 nil
                      (lambda (buf)
                        (bury-buffer buf)
                        (delete-window (get-buffer-window buf)))
                      buffer)))

(defun max/new-window-compilation-buffer ()
  "always use new window for compilation"
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
        (let* ((w (split-window-vertically))
               (h (window-height w)))
          (select-window w)
          (switch-to-buffer "*compilation*")
          (shrink-window (- h 20)))))))

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(electric-pair-mode 1)
(add-hook 'before-save-hook 'whitespace-cleanup)
(global-whitespace-mode)
(setq-default whitespace-style '(face tabs empty trailing lines-tail tab-mark))

;; set indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)


(global-set-key (kbd "<f5>") 'max-save-and-build)
(setq compilation-scroll-output 1)

(add-hook 'compilation-finish-functions 'max/bury-compile-buffer-if-successful)
(add-hook 'compilation-mode-hook 'max/new-window-compilation-buffer)

(provide 'init-programming)
