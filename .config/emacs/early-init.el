(setq gc-cons-threshold most-positive-fixnum)

(setq package-enable-at-startup nil
      package-quickstart nil
      load-prefer-newer t)

(setq native-comp-async-report-warnings-errors nil)

(add-to-list 'native-comp-eln-load-path (expand-file-name "packages/eln-cache/" user-emacs-directory))

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
