  (setq tramp-default-method "ssh")
  
  ;; GuixSd
 (with-eval-after-load "tramp" (setq tramp-remote-path
        (append tramp-remote-path
                '("~/.guix-profile/bin" "~/.guix-profile/sbin"
                  "/run/current-system/profile/bin" 
		  "/run/current-system/profile/sbin"))))

(provide 'setup-tramp)
