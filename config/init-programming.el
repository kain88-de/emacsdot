;; enable colorful highlighting of matching parentheses.
(max/install-package 'rainbow-delimiters)
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; auto close brackets and ident new lines
(electric-pair-mode 1)
;; Clean up whitespaces after save
(add-hook 'before-save-hook 'whitespace-cleanup)
;; show whitespaces by default
(global-whitespace-mode)
(setq-default whitespace-style '(face tabs empty trailing lines-tail tab-mark))
;; set indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(defun max-save-and-build ()
  "Save and build projects with projectile"
  (interactive)
  (projectile-save-project-buffers)
  (projectile-compile-project t))

(global-set-key (kbd "<f5>") 'max-save-and-build)
(setq compilation-scroll-output 1)

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
(add-hook 'compilation-finish-functions 'max/bury-compile-buffer-if-successful)

(defun max/close-compilation-buffer ()
  (when (not (get-buffer-window "*compilation*"))
    (save-selected-window
      (save-excursion
        (let* ((w (split-window-vertically))
               (h (window-height w)))
          (select-window w)
          (switch-to-buffer "*compilation*")
          (shrink-window (- h 20)))))))
(add-hook 'compilation-mode-hook 'max/close-compilation-buffer)

(provide 'init-programming)
