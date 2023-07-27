(setq use-short-answers t)

(setq confirm-kill-emacs (lambda (prompt)
                           (y-or-n-p-with-timeout prompt 2 nil)))

(defun @fenrir/reload ()
  (interactive)
  (load-file "~/.config/emacs/init.el"))

(setq x-underline-at-descent-line t)



(use-package explain-pause-mode
:straight (explain-pause-mode
           :host github
           :repo "lastquestion/explain-pause-mode")
:commands explain-pause-mode
:config
(setq explain-pause-alert-style 'silent))

(global-prettify-symbols-mode 1)

(add-hook 'prog-mode-hook (lambda () (display-line-numbers-mode 1)))

(setq display-line-numbers-width-start t
    display-line-numbers-type 'relative)

(setq use-dialog-box nil)

(use-package rainbow-delimiters
  :ensure t
  :hook
  (prog-mode . rainbow-delimiters-mode))

(provide 'setup-misc)
