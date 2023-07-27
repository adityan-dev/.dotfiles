(defun @fenrir/org-prettify-symbols ()
  (setq prettify-symbols-alist '(("TODO" . "")
                                 ("WAIT" . "")        
                                 ("NOPE" . "")
                                 ("DONE" . "")
                                 ("[#A]" . "")
                                 ("[#B]" . "")
                                 ("[#C]" . "")
                                 ("[ ]" . "")
                                 ("[X]" . "")
                                 ("[-]" . "")
                                 ("#+BEGIN_SRC" . "")
                                 ("#+END_SRC" . "―")
                                 ("#+begin_src" . "")
                                 ("#+end_src" . "―")
                                 ("#+AUTO_TANGLE" . "")
                                 (":PROPERTIES:" . "")
                                 ("#+PROPERTY:" . "")
                                 (":END:" . "―")
                                 ("#+STARTUP:" . "")
                                 ("#+TITLE: " . "")
                                 ("#+RESULTS:" . "")
                                 ("#+NAME:" . "")
                                 ("#+ROAM_TAGS:" . "")
                                 ("#+FILETAGS:" . "")
                                 ("#+HTML_HEAD:" . "")
                                 ("#+SUBTITLE:" . "")
                                 ("#+AUTHOR:" . "")
                                 (":Effort:" . "")
                                 ("SCHEDULED:" . "")
                                 ("DEADLINE:" . "")))
  (prettify-symbols-mode))

(defun @fenrir/org-set-faces ()
  ;; Increase the size of various headings
  (set-face-attribute 'org-document-title nil :font "Arial" :weight 'ultra-bold :height 1.5)

  (dolist (face '((org-level-1 . 1.2)
                  (org-level-2 . 1.15)
                  (org-level-3 . 1.1)
                  (org-level-4 . 1.1)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.1)
                  (org-level-7 . 1.1)
                  (org-level-8 . 1.1)))
    (set-face-attribute (car face) nil :font "Iosevka Comfy Motion" :weight 'ultra-bold :height (cdr face)))

  ;;;; Ensure that anything that should be fixed-pitch in Org files appears that way
  ;;(set-face-attribute 'org-block nil :inherit 'fixed-pitch)
  ;;(set-face-attribute 'org-table nil  :inherit 'fixed-pitch)
  ;;(set-face-attribute 'org-formula nil  :inherit 'fixed-pitch)
  ;;(set-face-attribute 'org-code nil   :inherit '(shadow fixed-pitch))
  ;;(set-face-attribute 'org-todo nil   :inherit '(shadow fixed-pitch))
  ;;;;(set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
  ;;(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
  ;;(set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  ;;(set-face-attribute 'org-document-info-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
  ;;(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
  ;;(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch)
  ;;
  ;; ;; Get rid of the background on column views
  ;;(set-face-attribute 'org-column nil)
  ;;(set-face-attribute 'org-column-title nil)
  )

(defun @fenrir/org-load-babel ()
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (python . t)
     (C . t)
     (gnuplot . t)
     (shell . t)
     (sql . t)
     (awk . t)
     (calc . t)
     (sqlite . t)
     (js . t)
     (latex . t)
     (css . t)
     (ditaa . t)
     (eshell . t)
     ;;(jupyter . t)
     (fortran . t)
     (java . t)
     (lisp . t)
     (org . t)
     (sass . t)
     (octave . t)
     ;;(arduino . t)
     ;;(hledger . t)
     ;;(ledger . t)
     ))
  )

(use-package org
  :ensure t
  :config
  (add-hook 'org-mode-hook '@fenrir/org-mode-hook)

  (add-hook 'org-mode-hook '@fenrir/org-prettify-symbols)
  (add-hook 'org-mode-hook '@fenrir/org-set-faces)
  (add-hook 'org-mode-hook '@fenrir/org-load-babel)

  (defun @fenrir/org-mode-hook ()
    (org-indent-mode)
    (auto-fill-mode 0)
    (display-line-numbers-mode 0)
    (visual-line-mode 1)
    (setq evil-auto-indent nil))

  (setq org-ellipsis " ▾"
        org-hide-emphasis-markers t
        org-src-fontify-natively t
        org-fontify-quote-and-verse-blocks t
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 2
        org-hide-block-startup nil
        org-src-preserve-indentation nil
        org-startup-folded 'content
        org-cycle-separator-lines 2
        org-capture-bookmark nil))

(evil-define-key '(normal insert visual) org-mode-map (kbd "C-j") 'org-next-visible-heading)
(evil-define-key '(normal insert visual) org-mode-map (kbd "C-k") 'org-previous-visible-heading)
(evil-define-key '(normal insert visual) org-mode-map (kbd "M-j") 'org-metadown)
(evil-define-key '(normal insert visual) org-mode-map (kbd "M-k") 'org-metaup)

(use-package org-superstar
  :ensure t
  :after org
  :hook
  (org-mode . org-superstar-mode)

  :config
  (setq org-superstar-remove-leading-stars t))

(use-package org-modern
  :demand
  :custom
  (org-modern-hide-stars nil)		; adds extra indentation
  (org-modern-table t)
  (org-modern-priority nil)
  (org-modern-todo nil)
  (org-modern-checkbox nil)
  (org-modern-block-name nil)
  (org-modern-keyword nil)
  (org-modern-block-fringe nil)


  :hook
  (org-mode . org-modern-mode)
  (org-agenda-finalize . org-modern-agenda))

(use-package mixed-pitch
  :hook
  ;; If you want it in all text modes:
  (text-mode . mixed-pitch-mode))

(use-package org-auto-tangle
  :ensure t
  :hook (org-mode . org-auto-tangle-mode))

(use-package org-appear
 :ensure t
 :hook (org-mode . org-appear-mode)
 :config
 (setq-default org-hide-emphasis-markers t)
 (setq org-appear-autoemphasis t
       org-appear-autosubmarkers t))

;; LSP
(use-package org-src-context
  :straight (:host github
                   :repo "karthink/org-src-context")
  :after org-src)

(provide 'setup-org)
