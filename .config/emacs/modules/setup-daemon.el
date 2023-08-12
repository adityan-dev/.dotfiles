(when (daemonp)
  (add-hook
   'after-init-hook
   (defun @fenrir/load-packages-eagerly ()
     (run-at-time 1 nil
                  (lambda () 
                    (let ((after-init-time (current-time)))
                      (when (featurep 'straight) (straight-check-all))
                      (dolist (lib '("org" "ob" "ox" "ol" "org-roam"
                                     "org-capture" "org-agenda" "org-fragtog"
                                     "org-gcal" "latex" "reftex" "cdlatex"
                                     "consult" "helpful" "elisp-mode"
                                     "notmuch" "elfeed" "simple"
                                     "expand-region" "embrace"
                                     "ace-window" "avy" "yasnippet"
                                     "magit" "modus-themes" "diff-hl"
                                     "dired" "ibuffer" "pdf-tools"
                                     "emacs-wm"))
                        (with-demoted-errors "Error: %S" (load-library lib)))
                      (when (featurep 'pdf-tools) (pdf-tools-install t))
                      (let ((elapsed (float-time (time-subtract (current-time)
                                                                after-init-time))))
                        (message "☯ Emacs Preloaded in %s seconds" elapsed))))))))

(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
(provide 'setup-daemon)
