(use-package persp-mode
  :ensure t
  :config
  (setq persp-autokill-buffer-on-remove 'kill-weak)
  (add-hook 'window-setup-hook #'(lambda () (persp-mode 1))))

(provide 'setup-workspaces)
