(use-package compile
  :defer t)
;; Colorize output of Compilation Mode, see
;; http://stackoverflow.com/a/3072831/355252
(use-package ansi-color
  :ensure t
  :defer t)

(defun max-save-and-build ()
  "Save and build projects with projectile"
  (interactive)
  (projectile-save-project-buffers)
  (projectile-compile-project t))

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

(evil-leader/set-key "cn" 'next-error)
(evil-leader/set-key "cp" 'previous-error)
(evil-leader/set-key "cc" 'max-save-and-build)

(provide 'init-compile)
