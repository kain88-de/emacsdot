(use-package projectile
  :ensure t
  :defer t
  :init
  (progn
    ;; evil projectile bindings
    (evil-leader/set-key "pp" 'helm-projectile-switch-project)
    (evil-leader/set-key "pf" 'helm-projectile-find-file)
    (evil-leader/set-key "pT" 'helm-projectile-find-test-file)
    (evil-leader/set-key "pb" 'helm-projectile-find-other-file)
    (evil-leader/set-key "pS" 'projectile-save-project-buffers)
    (evil-leader/set-key "pP" 'projectile-test-project)
    (evil-leader/set-key "pc" 'max-save-and-build)
    (evil-leader/set-key "pa" 'helm-projectile-find-other-file)
    (evil-leader/set-key "psa" 'helm-projectile-ack))
  :config (progn
	    (add-to-list 'projectile-globally-ignored-directories "build")
	    (projectile-global-mode))
  :diminish projectile-mode)

;; http://emacs.stackexchange.com/questions/10183/close-other-buffers-with-projectile
(defun max/kill-non-project-buffers (&optional kill-special)
  "Kill buffers that do not belong to a `projectile' project.

With prefix argument (`C-u'), also kill the special buffers."
  (interactive "P")
  (let ((bufs (buffer-list (selected-frame))))
    (dolist (buf bufs)
      (with-current-buffer buf
        (let ((buf-name (buffer-name buf)))
          (when (or (null (projectile-project-p))
                    (and kill-special
                         (string-match "^\*" buf-name)))
            ;; Preserve buffers with names starting with *scratch or *Messages
            (unless (string-match "^\\*" buf-name)
              (message "Killing buffer %s" buf-name)
              (kill-buffer buf))))))))

(provide 'init-projectile)
