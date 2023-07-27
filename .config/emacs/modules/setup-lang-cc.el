(use-package cc-mode
  :straight nil
  :config
  (add-hook 'c-mode-hook 'lsp-deferred)
  (add-hook 'c++-mode-hook 'lsp-deferred)
  (c-add-style "microsoft"
               '("stroustrup"
                 (c-offsets-alist
                  (innamespace . -)
                  (inline-open . 0)
                  (inher-cont . c-lineup-multi-inher)
                  (arglist-cont-nonempty . +)
                  (template-args-cont . +))))
  (setq c-default-style "microsoft")
  )

(use-package cmake-mode
  :ensure t
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'")
  :hook (cmake-mode . lsp-deferred))

(use-package cmake-font-lock
  :ensure t
  :after cmake-mode
  :config (cmake-font-lock-activate))

(use-package glsl-mode
  :ensure t
  :config
  (add-hook 'glsl-mode-hook 'lsp-deferred)
  (setq glsl-language-version "4.5")
  (setq lsp-glsl-executable '("glslls" "--stdin")))

(use-package dap-lldb
  :straight nil
  :config
  (setq dap-lldb-debug-program '("/usr/bin/lldb-vscode")))

(provide 'setup-lang-cc)
