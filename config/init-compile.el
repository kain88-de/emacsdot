(use-package compile)
;; Colorize output of Compilation Mode, see
;; http://stackoverflow.com/a/3072831/355252
(use-package ansi-color)

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
      (progn
        (run-with-timer .2 nil
                        (lambda (buf)
                          (bury-buffer buf)
                          (delete-window (get-buffer-window buf)))
                        buffer)
        (message "NO COMPILATION ERRORS"))))

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

;; Compilation from Emacs
(defun max/colorize-compilation-buffer ()
  "Colorize a compilation mode buffer."
  (interactive)
  ;; we don't want to mess with child modes such as grep-mode, ack, ag, etc
  (when (eq major-mode 'compilation-mode)
    (let ((inhibit-read-only t))
      (ansi-color-apply-on-region (point-min) (point-max)))))

(setq compilation-ask-about-save nil
      compilation-always-kill t
      compilation-scroll-output 'first-error)

(add-hook 'compilation-filter-hook #'max/colorize-compilation-buffer)
(global-set-key (kbd "<f5>") 'max-save-and-build)
(setq compilation-scroll-output 1)

(add-hook 'compilation-finish-functions 'max/bury-compile-buffer-if-successful)
;;(add-hook 'compilation-mode-hook 'max/new-window-compilation-buffer)

(evil-leader/set-key "cn" 'next-error)
(evil-leader/set-key "cp" 'previous-error)
(evil-leader/set-key "cc" 'max-save-and-build)

(provide 'init-compile)
