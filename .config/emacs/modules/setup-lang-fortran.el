(add-hook 'f90-mode-hook 'lsp-deferred)

(provide 'setup-lang-fortran)

(use-package rustic
  :ensure t
  :hook (rustic-mode . lsp-deferred)
  :config
  (setq rustic-format-on-save t))

(provide 'setup-lang-fortran)
