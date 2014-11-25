(require 'package)
;; (add-to-list 'package-archives 
;;     '("marmalade" .
;;       "http://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(package-initialize)

;; set PATH
(setq path "/Applications/Emacs.app/Contents/MacOS/bin:/usr/local/git/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/Users/emilyessenamanov/bin")
(setenv "PATH" path)
(setq exec-path (split-string path ":"))
;; (let ((path (concat (getenv "PATH") ":/opt/local/bin")))
;;   (setenv "PATH" path)
;;   (setq exec-path (split-string path path-separator)))

;; Other places to find .el files
(add-to-list 'load-path "~/emacs.d")

;; (load-file "~/.emacs.d/mobyte/hl-line+.el")
;; general settings
;;(load-file "~/.emacs.d/mobyte/yaml-mode.el")
;; (add-to-list 'load-path "/Users/mobyte/src/magit")
;; (require 'magit)
;; ; smex
;; (load-file "~/.emacs.d/smex.el")
; general settings
(load-file "~/.emacs.d/mobyte/misc_sets.el")
; shell buffers
(load-file "~/.emacs.d/mobyte/develope.el")
;; paredit
(load-file "~/.emacs.d/mobyte/paredit_conf.el")
;; doo
(load-file "~/.emacs.d/mobyte/clojure_mode_conf.el")
;; cider
(load-file "~/.emacs.d/mobyte/cider.el")
;; ibuffer
(load-file "~/.emacs.d/mobyte/ibuffer_conf.el")
;; ace jump
(load-file "~/.emacs.d/mobyte/ace_jump.el")
;; ac nrepl
;; (load-file "~/.emacs.d/mobyte/ac-nrepl.el")
;; ac cider
;; (load-file "~/.emacs.d/mobyte/ac-cider.el")
; config indent
;; (load-file "~/.emacs.d/mobyte/mobindent.el")
; slime
;; (load-file "~/.emacs.d/mobyte/slime_opts.el")
; xml parsing (xmllint)
(load-file "~/.emacs.d/mobyte/xml-parsing.el")
; clipboard
;; (load-file "~/.emacs.d/mobyte/clipboard.el")
;  automatically detect coding system with Enca
;;(load-file "~/.emacs.d/mobyte/auto-enca.el")
; function for recode buffer 2 given charset
;; (load-file "~/.emacs.d/mobyte/mobrecode.el")
; mode for notes
;; (load-file "~/.emacs.d/mobyte/mobnote-mode.el")
; load org-mode settings
(load-file "~/.emacs.d/mobyte/org-mode-conf.el")
; some actions on start
(load-file "~/.emacs.d/mobyte/start_actions.el")

;; (load "/home/mobyte/src/emacs/haskell-mode-2.4/haskell-site-file")
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; (add-hook 'haskell-mode-hook 'font-lock-mode)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-battery-mode nil)
 '(display-time-mode nil)
 '(global-font-lock-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(org-agenda-files (quote ("~/tmp/1.org")))
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(cd "~/")

(server-start)