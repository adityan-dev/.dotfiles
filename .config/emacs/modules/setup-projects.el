(use-package projectile
  :ensure t
  :diminish projectile-mode
  :custom
  ((projectile-completion-ststem 'ivy))
  :config
  (projectile-mode)

  :init
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(provide 'setup-projects)
