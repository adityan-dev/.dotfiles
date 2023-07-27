(use-package magit
  :ensure t
  :commands
  (magit-status magit-get-current-branch)
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(use-package evil-magit
  :ensure t
  :after magit)

(provide 'setup-git)
