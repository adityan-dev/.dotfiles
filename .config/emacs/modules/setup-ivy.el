(use-package counsel
  :demand
  :bind (("M-x" . 'counsel-M-x)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil) ; remove ^
  (counsel-mode 1)) 

(use-package ivy
  :ensure t
  :diminish

  :bind
  (("C-s" . swiper)
   :map ivy-minibuffer-map
   ("TAB" . ivy-alt-done)	
   ("C-l" . ivy-alt-done)
   ("C-j" . ivy-next-line)
   ("C-k" . ivy-previous-line)
   :map ivy-switch-buffer-map
   ("C-k" . ivy-previous-line)
   ("C-l" . ivy-done)
   ("C-d" . ivy-switch-buffer-kill)
   :map ivy-reverse-i-search-map
   ("C-k" . ivy-previous-line)
   ("C-d" . ivy-reverse-i-search-kill))

  :config
  (ivy-mode 1))

(use-package ivy-rich
  :demand
  :init
  (ivy-rich-mode 1))

(use-package ivy-prescient
  :ensure t
  :after counsel
  :custom
  (ivy-prescient-enable-filtering nil)
  :config
  (prescient-persist-mode 1)
  (ivy-prescient-mode 1))

(provide 'setup-ivy)
