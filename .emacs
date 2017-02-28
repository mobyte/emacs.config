;;* emacs packages config
(require 'package)

;; (add-to-list 'package-archives 
;;     '("marmalade" .
;;       "http://marmalade-repo.org/packages/"))

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
;; (add-to-list 'package-archives
;;              '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; (add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(package-initialize)

;; Other places to find .el files
(add-to-list 'load-path "~/.emacs.d/opt")

;;* outline config

(eval-after-load "outline"
  (lambda ()
    (define-key outline-minor-mode-map
      [(shift control n)] 'outline-next-visible-heading)
    (define-key outline-minor-mode-map
      [(shift control p)] 'outline-previous-visible-heading)
    (define-key outline-minor-mode-map
      [(tab)] 'org-cycle)
    (define-key outline-minor-mode-map
      [(meta o)] 'outline-toggle-children)))

(add-hook 'outline-minor-mode-hook
          (lambda ()
            (set (make-local-variable 'outline-regexp)
                 "^;;\\*+")
            (set (make-local-variable 'outline-level)
                 (lambda ()
                   (let ((len (- (match-end 0) (match-beginning 0))))
                     (- len 2))))))

;; (add-hook 'emacs-lisp-mode-hook
;;           (lambda ()
;;               (outline-minor-mode 1)))

;;* shell path

(setenv "BOOT_JVM_OPTIONS" "-XX:-OmitStackTraceInFastThrow")
(setenv "EDITOR" "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient")
(exec-path-from-shell-initialize)


;;* general settings

(setq visible-bell t)
(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)

;;* custom settings

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
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(ispell-program-name "/usr/bin/aspell")
 '(make-backup-files nil)
 '(org-agenda-files (quote ("~/tmp/1.org")))
 '(package-selected-packages
   (quote
    (company-cabal company-quickhelp shakespeare-mode company-ghc company-ghci haskell-mode magit magit-popup zoom-frm smex shell-command projectile key-chord htmlize exec-path-from-shell company clj-refactor auto-complete auto-compile ace-jump-mode)))
 '(safe-local-variable-values (quote ((eval hide-sublevels 1) (aaa . bbb))))
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))

(set-default-font "Monaco 16")
(set-background-color "black")
(set-face-background 'default "black")
(set-face-background 'region "black")
(set-face-foreground 'default "white")
(set-face-foreground 'region "gray60")
(set-foreground-color "white")
(set-cursor-color "white")
;;(global-hl-line-mode 1)
;;(set-face-background 'hl-line "#330")
(set-face-background 'region "#134F78")

(setq mode-require-final-newline nil)
(setq require-final-newline nil)

;;* disable emacs gui elements

(menu-bar-mode nil)
;;(scroll-bar-mode nil)
(tool-bar-mode 0)

;;* coding system

(setq default-buffer-file-coding-system 'utf-8)
(setq default-input-method 'russian-computer)

;;* external programms settings
(setq browse-url-browser-function 'browse-url-generic browse-url-generic-program "opera")
;;* ido mode

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(global-set-key (kbd "C-x C-b") nil)

;;* smex

(require 'smex)
;; (global-set-key [(meta x)] (lambda ()
;;                              (interactive)
;;                              (or (boundp 'smex-cache)
;;                                  (smex-initialize))
;;                              (global-set-key [(meta x)] 'smex)
;;                              (smex)))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)

;;* general keybinding settings

;; disabled hot keys
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'erase-buffer 'disabled nil)

(global-set-key (kbd "C-<home>") 'beginning-of-buffer)
(global-set-key (kbd "C-<end>") 'end-of-buffer)

;; command key to meta
(setq mac-command-modifier 'meta)

;; set hotkey to switch frame
(defun go-to-next-frame ()
       (interactive)
       (other-frame 1))
;; (global-set-key (kbd "M-`") 'go-to-next-frame)
(global-set-key (kbd "M-§") 'go-to-next-frame)

;; set hotkey to next/prev paragraphs

(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

;; disable Ctrl-z

(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "C-x C-z") 'nil)

;;* show current buffer filename

(defun buffer-info ()
  (interactive)
  (message (buffer-file-name)))

;;* backup files settings

;; (Add-to-list 'backup-directory-alist
;;              (cons "." "~/.emacs.d/backups/"))

(setq backup-directory-alist `(("." . "~/.emacs.d/backups/")))
;; (setq backup-by-copying t)
;; (setq tramp-backup-directory-alist backup-directory-alist)

;;* navigation

(defun n-lines-down ()
  (interactive)
  (dotimes (n 5 nil)
    (next-line)))

(defun n-lines-up ()
  (interactive)
  (dotimes (n 5 nil)
    (previous-line)))

(global-set-key (kbd "S-C-n") 'n-lines-down)
(global-set-key (kbd "S-C-p") 'n-lines-up)

;;* window management

(global-set-key (kbd "C-x p") 'previous-buffer)
(global-set-key (kbd "C-x n") 'next-buffer)

(global-set-key (kbd "C-1") 'windmove-left)
(global-set-key (kbd "C-2") 'windmove-right)
(global-set-key (kbd "C-3") 'windmove-up)
(global-set-key (kbd "C-4") 'windmove-down)

;; when new window arise automatically (errors, etc) allow only split window vertically 
(setq split-height-threshold 80)
(setq split-width-threshold 160)

;; kill window next to current

(defun kill-below-window ()
  (interactive)
  (windmove-down)
  (delete-window))

(defun kill-upper-window ()
  (interactive)
  (windmove-up)
  (delete-window))

(defun kill-right-window ()
  (interactive)
  (windmove-right)
  (delete-window))

(defun kill-left-window ()
  (interactive)
  (windmove-left)
  (delete-window))

(global-set-key (kbd "C-x M-k r") 'kill-right-window)
(global-set-key (kbd "C-x M-k l") 'kill-left-window)
(global-set-key (kbd "C-x M-k u") 'kill-upper-window)
(global-set-key (kbd "C-x M-k b") 'kill-below-window)

;;* shell settings

;; eshell

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(defun cur-dir-git-branch-string (pwd)
  "Return current git branch as a string.
If PWD is in a git repo and the git command is found, then return the
current git branch as a string.  Otherwise return an empty string."
  (interactive)
  (when (and (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let* ((git-cmd "git branch")
           (grep-cmd "grep '\\*'")
           (sed-cmd "sed -e 's/^\\* //'")
           (git-output (shell-command-to-string (concat git-cmd " | " grep-cmd " | " sed-cmd))))
      (concat "[git:"
              (if (> (length git-output) 0)
                  (substring git-output 0 -1)
                "(no branch)")
              "] "))))

;; Change the default eshell prompt

(setq eshell-prompt-function
      (lambda ()
        (concat ""
                ;; (cur-dir-git-branch-string (eshell/pwd))
                ;; (propertize (concat "[" (getenv "USER") "@" system-name "] ")
                ;;             'face `(:foreground "darkblue"))
                (propertize (replace-regexp-in-string (concat "^" (getenv "HOME")) "~" (eshell/pwd))
                            'face `(:foreground "darkgreen"))
                (propertize (if (= (user-uid) 0) " #" " $")
                            'face `(:foreground "yellow"))
                (propertize " "
                            'face `(:foreground "white")))))


;; (defadvice ansi-term (after advice-term-line-mode activate)
;;   (term-line-mode))

(defun clear-shell-buffer ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer))
  (term-send-raw-string "clear\n"))

(eval-after-load "term"
  (lambda ()
    (define-key term-raw-map
      (kbd "C-y") 'term-paste)
    (define-key term-mode-map
      (kbd "C-x M-O") 'clear-shell-buffer)))

;; turn off shell command echo

(defun my-comint-init () 
  (setq comint-process-echoes t))

(add-hook 'comint-mode-hook 'my-comint-init)

;;* clear buffer

(defun clear-buffer ()
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(global-set-key (kbd "C-x M-O") 'clear-buffer)

;;* yank settings
;; (add-to-list 'yank-excluded-properties 'font)
;; (add-to-list 'yank-excluded-properties 'font-lock-face)
(setq yank-excluded-properties t)

;;* auto completion keys

;; (require 'auto-complete-config)
;; (define-key ac-completing-map (kbd "C-n") 'ac-next)
;; (define-key ac-completing-map (kbd "C-p") 'ac-previous)

;;* highlight line

;; (require 'hl-line+)
;; (toggle-hl-line-when-idle 1)
;; (global-hl-line-mode 1)
;; (flash-line-highlight 1)
;; (setq hl-line-flash-show-period 10)

;; (global-hl-line-mode 1)
;; (set-face-background 'hl-line "#3e4446")
;; (set-face-foreground 'highlight nil)

;;* magit

(global-set-key (kbd "C-x g") 'magit-status)

(setq url-magit-cheatsheet "http://daemianmack.com/magit-cheatsheet.html")
(defun browse-magit-cheatsheet ()
  (interactive)
  (eww url-magit-cheatsheet))

(defun magit-commit-mode-hook-fn ()
  (turn-off-auto-fill))

(add-hook 'git-commit-mode-hook 'magit-commit-mode-hook-fn)

(setq git-commit-summary-max-length 120)
(setq magit-push-always-verify nil)

;;* paredit

(projectile-global-mode)

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."
  t)

(eval-after-load "paredit"
  '(progn
     (define-key paredit-mode-map (kbd "M-[") 'paredit-wrap-square)
     (define-key paredit-mode-map (kbd "M-{") 'paredit-wrap-curly)
     (define-key paredit-mode-map (kbd "M-]") 'paredit-close-square-and-newline)
     (define-key paredit-mode-map (kbd "M-}") 'paredit-close-curly-and-newline)))

(add-hook 'nrepl-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'nrepl-mode-hook             (lambda () (paredit-mode +1)))

(mapc (lambda (hook) (add-hook hook (lambda ()
                                      (paredit-mode +1))))
      '(clojure-mode-hook
        slime-repl-mode-hook
        lisp-mode-hook
        emacs-lisp-mode-hook
        scheme-mode-hook
        t-mode-hook))


;;;; repl mode

;;(add-hook 'clojure-mode-hook 'projectile-mode)

(defun setup-slime-repl-paredit ()
  (define-key cider-repl-mode-map
    (kbd "DEL") 'paredit-backward-delete)
  (define-key cider-repl-mode-map
    (kbd "{") 'paredit-open-curly)
  (define-key cider-repl-mode-map
    (kbd "}") 'paredit-close-curly)
  (modify-syntax-entry ?\{ "(}")
  (modify-syntax-entry ?\} "){")
  (modify-syntax-entry ?\[ "(]")
  (modify-syntax-entry ?\] ")[")
  (modify-syntax-entry ?~ "'   ")
  (modify-syntax-entry ?, "    ")
  (modify-syntax-entry ?^ "'")
  (modify-syntax-entry ?= "'"))

(add-hook 'cider-repl-mode-hook 'setup-slime-repl-paredit)
;(add-hook 'slime-nrepl-mode-hook 'setup-slime-repl-paredit)
;(add-hook 'slime-cider-mode-hook 'setup-slime-repl-paredit)

;;;;(add-hook 'clojure-mode-hook 'setup-clojure-mode-paredit)

(defun cider-connection-infos (connection-buffer)
  (with-current-buffer (get-buffer connection-buffer)
    nrepl-endpoint))

(defun cider-current-connection-infos ()
  (cider-connection-infos (nrepl-current-connection-buffer)))

(defun cider-rotate-connection-list (connection-list)
  (append (rest connection-list)
          (list (first connection-list))))

(defun cider-show-current-connection ()
  (apply #'message
         "Active cider connection: Host=%s Port=%s"
         (cider-current-connection-infos)))

(defun cider-switch-to-next-connection ()
  (interactive)
  (setq nrepl-connection-list
        (cider-rotate-connection-list nrepl-connection-list))
  (cider-show-current-connection))

(global-set-key (kbd "C-c C-x n") 'cider-switch-to-next-connection)

;; (setq cider-repl-pop-to-buffer-on-connect nil)

;; (setq cider-repl-popup-stacktraces t)
;; (setq cider-show-error-buffer 'except-in-repl)
(setq cider-show-error-buffer t)

(global-set-key (kbd "C-c C-x n") 'cider-visit-error-buffer)

(setq nrepl-buffer-name-show-port t)

(add-hook 'cider-repl-mode-hook 'paredit-mode)

;; Enable error buffer popping also in the REPL
(setq nrepl-popup-stacktraces-in-repl t)

(setq nrepl-popup-stacktraces t)

(setq cider-auto-select-error-buffer t)

(setq nrepl-sync-request-timeout nil)

;; skip the cider's welcome message
(setq cider-repl-display-help-banner nil)

;; clj-refactor-mode

(require 'clj-refactor)

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  ;; do not group required namespaces by prefix
  (setq cljr-favor-prefix-notation nil)
  ;; do not warn
  (setq cljr-warn-on-eval nil)
  (setq cljr-warn-on-analyzer-needs-eval nil)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-r"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)


;; auto complete

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'clojure-mode-hook #'eldoc-mode)

(require 'company-etags)
(add-to-list 'company-etags-modes 'clojure-mode)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; (define-key company-active-map (kbd "C-n") 'company-complete-common-or-cycle)
;; (define-key company-active-map (kbd "C-p") 'company-complete-common-or-previous-cycle)

(require 'color)
(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face :background ,(color-lighten-name bg 25)))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

;; (require 'auto-complete-config)

;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'cider-repl-mode))

;; (ac-config-default)
;; (setq ac-auto-start nil)

;; (define-key ac-completing-map "\M-/" 'ac-stop) ; use M-/ to stop completion
;; (define-key ac-mode-map (kbd "C-\\") 'auto-complete)
;; (define-key ac-completing-map (kbd "TAB") nil)
;; (define-key ac-completing-map (kbd "RET") 'ac-complete)
;; (define-key ac-completing-map (kbd "C-\\") 'ac-complete)

;; (require 'ac-cider)
;; (add-hook 'cider-mode-hook 'ac-cider-setup)
;; (add-hook 'cider-mode-hook 'ac-flyspell-workaround)
;; (add-hook 'cider-repl-mode-hook 'ac-cider-setup)
;; (eval-after-load "auto-complete"
;;   '(progn
;;      (add-to-list 'ac-modes 'cider-mode)
;;      (add-to-list 'ac-modes 'cider-repl-mode)))

;; (defun set-auto-complete-as-completion-at-point-function ()
;;   (setq completion-at-point-functions '(auto-complete)))

;; (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
;; (add-hook 'cider-mode-hook 'set-auto-complete-as-completion-at-point-function)

;; (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;;; repl history

(setq cider-repl-history-size 1000)
(setq cider-repl-history-file (concat (getenv "HOME") "/.emacs.d/repl-history"))

(setq nrepl-hide-special-buffers t)
(setq cider-repl-use-clojure-font-lock t)

(add-hook 'cider-repl-mode-hook 'clojure-font-lock-setup)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)

;;(setq cider-repl-output-face t)
;;(setq cider-repl-input-face t)

;; pretty print REPL output
(setq cider-repl-use-pretty-printing nil)

(setq nrepl-log-messages t)

(require 'eldoc)
(setq eldoc-idle-delay 0)
(setq eldoc-echo-area-use-multiline-p t)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
;; (define-key cider-mode-map (kbd "C-c C-d") 'ac-nrepl-popup-doc)

(require 'clojure-mode)

(eval-after-load 'clojure-mode
  '(define-clojure-indent
     (wrap-result 'defun)
     (handle-error 'defun)
     (context-defn 'defun)
     (context-fn 'defun)
     (context-fn-stub 'defun)
     (defroutes 'defun)
     (testing 'defun)
     (feature 'defun)
     (scenario 'defun)
     (cond-let 'defun)
     (if-with-open 'defun)
     (when-let* 'defun)
     (fnk 'defun)
     (fact 'defun)
     (facts 'defun)
     (conditional 'defun)
     (GET 2)
     (POST 2)
     (PUT 2)
     (DELETE 2)
     (HEAD 2)
     (ANY 2)
     (context 2)))

;; (defun restart-repl ()
;;   (interactive)
;;   (cider-quit)
;;   (cider-jack-in))

(require 'ob)

(add-to-list 'org-babel-tangle-lang-exts '("clojure" . "clj"))

(defvar org-babel-default-header-args:clojure 
  '((:results . "silent") (:tangle . "yes")))

(defun org-babel-execute:clojure (body params)
  "Evaluate a block of Clojure code with Babel."
  (lisp-eval-string body)
  "Done!")

(provide 'ob-clojure)
(setq org-src-fontify-natively t)

;;* ibuffer

(require 'ibuffer)

(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("Shell"
                (mode . eshell-mode))
               ("REPL"
                (name . "^\\*slime-repl.*\\*$"))
               ("Clojure"
                (name . "^.*\\.clj$"))
               ("Lisp"
                (name . "^.*\\.lisp$"))
               ("Emacs lisp"
                (name . "^.*\\.el$"))
               ("Dired"
                (mode . dired-mode))
               ("Egg"
                (name . "^.*\.git.*$"))
               ("SpecialBuffers" 
                ;;(or (name . "^\\*scratch\\*$")
                ;;(name . "^\\*Warnings\\*$")
                ;;(name . "^\\*Completions\\*$")
                ;;(name . "^\\*Messages\\*$"))
                (name . "^\\*.*\\*$"))
               ("org" 
                (mode . org-mode))
               ("planner" 
                                        ;(or (name . "^\\*Calendar\\*$")                        
                (name . "^diary$"))
               ))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

;; (global-set-key (kbd "C-x <down>") 'ibuffer)
;; (global-set-key (kbd "C-x x") 'ibuffer)
;;(global-set-key (kbd "C-x C-b") 'ibuffer)

;;* ace jump

(require 'ace-jump-mode)
(setq key-chord-one-key-delay 0.16)

(key-chord-define-global "jf" 'ace-jump-mode)
(key-chord-define-global "fj" 'ace-jump-mode)
;;(key-chord-define-global "jj" 'ace-jump-char-mode)
(key-chord-mode 1)

(global-set-key (kbd "C-c SPC") 'ace-jump-char-mode)
;;(define-key global-map (kbd "C-x o") 'other-window)

(eval-after-load 'shell
  '(define-key shell-mode-map (kbd "C-c SPC") 'ace-jump-char-mode))

;;* xml parsing (xmllint)

;; (defun parse_xml ()
;;   (interactive)
;;   (xml-mode)
;;   (mark-whole-buffer)
;;   (universal-argument)
;;   (shell-command-on-region (point-min) (point-max) "xmllint --format -" 'current 'yes ) )

;; (global-set-key (kbd "C-`") 'parse_xml)
;; (global-set-key (kbd "C-`") nil)

;;* clipboard for X

;; (defun paste-clipboard ()
;;   (interactive)
;;   (set-clipboard-coding-system 'utf-8)
;;   (insert (x-get-selection 'CLIPBOARD 'UTF8_STRING)))

;; (defun copy-clipboard ()
;;   (interactive)
;;   (set-clipboard-coding-system 'utf-8)
;;   (x-set-selection 'CLIPBOARD 
;;                    (buffer-substring (region-beginning) (region-end)))
;;   (keyboard-quit))

;; (global-set-key (kbd "C-x y") 'paste-clipboard)
;; (global-set-key (kbd "C-x w") 'copy-clipboard)

;;* function for recode buffer 2 given charset

;; (defun recode-buffer-safe (target-coding-system)
;;   "* Recode buffer as if it were encoded with `target-coding-system'.
;; If current buffer is write-protected (`buffer-read-only'), do nothing."
;;   (interactive "zEnter target coding system: ")
;;   (unless buffer-read-only
;;     (encode-coding-region (point-min)
;;                           (point-max)
;;                           buffer-file-coding-system)
;;     (decode-coding-region (point-min)
;;                           (point-max)
;;                           target-coding-system)
;;     (set-buffer-file-coding-system target-coding-system)))

;;* mode for notes
;; (load-file "~/.emacs.d/mobyte/mobnote-mode.el")
;;* load org-mode settings

(setq org-directory "/Users/Documents/org")

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(customize-set-variable 'org-file-apps
                        '(("pdf" . "kpdf %s")
                          ("docx" . "soffice %s")
                          ("xlsx" . "soffice %s")
                          ("pptx" . "soffice %s")
                          ("doc"  . "soffice %s")
                          ("xls"  . "soffice %s")
                          ("ppt"  . "soffice %s")
                          ("ods"  . "soffice %s")
                          ("odw" . "soffice %s")
                          ("odp" . "soffice %s")
                          ("pdf" . "acroread %s")))

;local settings applies by 
;#+SEQ_TODO: TODO WAITING DONE
(setq org-todo-keywords
       '((sequence "TODO" 
                   "WAITING" 
                   "INPROGRESS" 
                   "DELEGATED" 
                   "DONE")))

;local settings applies by 
;#+STARTUP: showstars
;#+STARTUP: hidestars
(setq org-hide-leading-stars t)
(setq org-startup-indented t)

(setq org-agenda-start-on-weekday 1)
(setq calendar-week-start-day 1)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-remember)
;(define-key global-map "\C-cr" 'remember)
(setq org-log-done t)

;(org-remember-insinuate)
(setq org-remember-templates
      '(("Todo" ?t "* %U %?" "~/temp/notes_dir/tasks.org" "úÁÍÅÔËÉ ÎÁ ÐÏÐÏÚÖÅ ÒÁÚÏÂÒÁÔØ")))
;      '(("Todo" ?t "** %U %^{Summary}\n%?" "~/temp/notes_dir/tasks.org" "úÁÍÅÔËÉ ÎÁ ÐÏÐÏÚÖÅ ÒÁÚÏÂÒÁÔØ")))

;;(setq truncate-lines t)
;;(setq org-startup-truncated nil)



;;(defun mob-insert-current-time ()
;; (interactive)
;; (org-insert-item)
;; (org-insert-time-stamp (current-time) 'with-hm 'inactive))

;;(global-set-key (kbd "C-x <up>") 'mob-insert-current-time)
;;(global-set-key (kbd "C-x <up>") nil)

;;* custom set variables and faces


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#191919"))))
 '(company-scrollbar-fg ((t (:background "#0c0c0c"))))
 '(company-tooltip ((t (:inherit default))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face :background "#3f3f3f")))))

;;* some actions on start

;; kill *scratch* buffer
(kill-buffer "*scratch*")

; kill all buffers

;(defun nuke-all-buffers ()
;  "kill all buffers"
;  (interactive)
;  (mapcar (lambda (x) (kill-buffer x))
;	  (buffer-list))
;  (delete-other-windows))

(cd "~/")
(server-start)

;;* local buffer variables

;; Local Variables:
;; eval: (outline-minor-mode 1)
;; eval: (hide-sublevels 1)
;; End:
;;* presentation toggle

(defun switch-to-presentation ()
  (interactive)
  (if (equal (current-buffer) (get-buffer "*presentation*"))
      (jump-to-register 113)
      (progn (window-configuration-to-register 113)
             (jump-to-register 112))))

(global-set-key (kbd "C-x C-x") 'switch-to-presentation)

;;* initial execution

(split-window-right)
(other-window 1)

;(setq display-buffer-alist '(("\\`\\*e?shell" display-buffer-same-window)))

;; Open shell in default project directory
(let ((default-directory (shell-command-to-string ". ~/.bashrc; echo -n $CURRENT_PROJECT")))
  (when (not (s-blank? default-directory))
    (shell)))

;;* haskell http://stackoverflow.com/questions/26603649/haskell-repl-in-emacs
(require 'haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'linum-mode)
(add-to-list 'exec-path "~/Library/Haskell/bin")
(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-file)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map "\C-ch" 'haskell-hoogle)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-ode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(require 'company-ghci)
(push 'company-ghci company-backends)
(add-hook 'haskell-mode-hook 'company-mode)
(add-hook 'haskell-interactive-mode-hook 'company-mode)

;;;;;;

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'company-mode)
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))

(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)))
(eval-after-load 'haskell-cabal '(progn
  (define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
  ;(define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-ode-clear)
  (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

;;;;;;;

(custom-set-variables
 '(haskell-font-lock-symbols (quote unicode))
 '(haskell-hoogle-command nil)
 '(haskell-mode-hook
   (quote
    (linum-mode turn-on-haskell-indentation turn-on-haskell-doc-mode)) t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-load-or-reload-prompt t)
 '(haskell-process-suggest-language-pragmas nil)
 '(haskell-process-suggest-no-warn-orphans t)
 '(haskell-process-use-presentation-mode t)
 '(haskell-tags-on-save t)
 '(inferior-haskell-wait-and-jump t)
 '(safe-local-variable-values
   (quote
    ((haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4))))
 '(haskell-interactive-mode-hide-multi-line-errors nil)
 '(haskell-process-log t)
 '(haskell-process-type (quote cabal-repl)))

(ac-config-default)
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(defun my-ac-haskell-mode ()
  (setq ac-sources (append ac-sources '(ac-source-ghc-mod))))

(add-hook 'haskell-mode-hook 'my-ac-haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

(ac-define-source ghc-mod
                  '((depends ghc)
                    (candidates . ghc-select-completion-symbol)
                    (symbol . "s")
                    (cache)))