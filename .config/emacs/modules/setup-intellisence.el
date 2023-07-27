(defun @fenrir/lsp-settings ()
  (setq lsp-headerline-breadcrumb-segments '(project file symbols))
  (setq lsp-headerline-breadcrumb-icons-enable t)
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (lsp-mode . @fenrir/lsp-settings)
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-completion-show-detail t)
  (setq lsp-signature-auto-activate t)
  (setq lsp-signature-render-documentation t)
  (setq lsp-ui-doc-enable nil))

(use-package lsp-ivy
  :ensure t)

(use-package lsp-treemacs
  :ensure t
  :after lsp)

(use-package dap-mode
  :ensure t
  :custom
  (dap-auto-configure-mode t)
  (dap-auto-configure-features
   '(sessions locals breakpoints expressions tooltip))

  :config
    (dap-mode 1)
    (dap-ui-mode 1)
    (dap-tooltip-mode 1)
    (tooltip-mode 1)
    (dap-ui-controls-mode 1))

(use-package company
  :ensure t
  ;;:after lsp-mode
  :bind
  (:map company-active-map
        ("<tab>" . company-complete-selection))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0)
  :config
  (setq company-tooltip-align-annotations t)
  (setq company-tooltip-flip-when-above t)
  (add-hook 'after-init-hook 'global-company-mode)
  (add-hook 'prog-mode 'company-mode)
  (add-hook 'org-mode-hook 'company-mode))

(provide 'setup-intellisence)
