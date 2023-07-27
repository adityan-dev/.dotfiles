(use-package which-key
  :straight t
  :ensure t
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-popup-type 'side-window)
  (which-key-setup-side-window-right)
  )

(use-package helpful
  :ensure t
  :commands (helpful-callable helpful-variable helpful-command helpful-key)

  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)

  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(provide 'setup-help)
