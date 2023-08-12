(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (lsp-deferred))))

;; (use-package conda
;;   :ensure t
;;   :custom (conda-anaconda-home)
;;   :init
;;   (custom-set-variables '(conda-anaconda-home "~/Anaconda3/"))
;;   (setq conda-env-home-directory (expand-file-name "~/Anaconda3/"))
;;   (conda-env-activate "base")
;;   (conda-env-initialize-interactive-shells)
;;   (conda-env-initialize-eshell)
;;   (conda-env-autoactivate-mode nil)
;;   (add-hook 'find-file-hook (lambda () (when (bound-and-true-p conda-project-env-path)
;;                                             (conda-env-activate-for-buffer)))))

(use-package jupyter
  :ensure t)

(use-package python
  :config
  (require 'dap-python)
  (setq dap-python-debugger 'debugpy)
  )

(provide 'setup-lang-python)
