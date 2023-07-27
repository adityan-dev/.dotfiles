(defvar bootstrap-version)
(defvar straight-base-dir (expand-file-name "packages/" user-emacs-directory))
(let ((bootstrap-file
       (expand-file-name "packages/straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer		
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)
(eval-when-compile
  (eval-after-load 'advice
    `(setq ad-redefinition-action 'accept))
  (setq use-package-verbose nil
        use-package-compute-statistics nil
        ;;use-package-ignore-unknown-keywords t
        use-package-minimum-reported-time 0.01
        ;; use-package-expand-minimally t
        use-package-enable-imenu-support t)
  (require 'use-package))

(defun @fenrir/lock-packages ()
  (interactive)
  (straight-freeze-versions))

(defun @fenrir/rollback-packages ()
  (interactive)
  (straight-thaw-versions))

(defun @fenrir/update-packages ()
  (interactive)
  (straight-fetch-all)
  (@fenrir/reload))

(provide 'setup-straight)
