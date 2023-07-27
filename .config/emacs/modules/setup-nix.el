(use-package nix-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode)))

(provide 'setup-nix)
