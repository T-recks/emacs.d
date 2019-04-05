(defvar *my-global-keybindings* nil
  "A list of user-defined global keybindings.")

(defun make-global-keybindings (key-pairs)
  "KEY-PAIRS are of the form (string symbol) where STRING contains the key combination and SYMBOL is the function to call."
  (append (mapcar (lambda (x)
                    (list 'global-set-key (list 'kbd (car x)) (cadr x)))
                  key-pairs)
          (mapcar (lambda (x)
                    (list 'push-new-global-keybinding `',x))
                  key-pairs)))

(defun push-new-global-keybinding (key-pair)
  (unless (member key-pair *my-global-keybindings*)
    (push key-pair *my-global-keybindings*)))

(defmacro def-global-keys (&rest key-pairs)
  "Expand a series of (str sym) -> (global-set-key (kbd str) sym)."
  `(progn ,@(make-global-keybindings key-pairs)))

(def-global-keys
  ("C-x O" 'mode-line-other-buffer)
  ("s-a" 'org-agenda)
  ;; Rebinding these to Ctrl-r and Ctrl-R since swiper is bound to Ctrl-s.
  ("C-r" 'isearch-forward)
  ("C-S-R" 'isearch-backward)
  ("<s-return>" 'ansi-term)
  ("C-x b" 'ibuffer)
  ("C-x C-b" 'ido-switch-buffer)
  ("C-c s-e" 'config-visit)
  ("C-c s-r" 'config-reload)
  ("C-c s-s" 'stumpwm-config)
  ("C-x 2" 'split-and-follow-horizontally)
  ("C-x 3" 'split-and-follow-vertically)
  ("C-c w w" 'kill-whole-word)
  ("C-c w l" 'copy-whole-line)
  ("C-x k" 'kill-current-buffer)
  ("C-M-s-k" 'kill-all-buffers))

(setq
 ido-enable-flex-matching nil
 ido-create-new-buffer 'always
 ido-everywhere t)
(ido-mode t)

;; vertical ido
;; ido-vertical-mode from the package destroys C-h f performance in conjunction with ido-ubiquitous-mode
;; so we use our own ido-vertical
;; taken from the wiki page
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))

(add-to-list 'display-buffer-alist
             '("*Apropos*" display-buffer-same-window))
(add-to-list 'display-buffer-alist
             '("*Help*" display-buffer-same-window))

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(defun kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(defun mark-line ()
  (interactive)
  (move-beginning-of-line nil)
  (set-mark-command nil)
  (move-end-of-line nil))

(defun comment-box-line ()
  (interactive "*r\np")
  (mark-line)
  (comment-box))

;; Center screen on menu item when moving up.
(advice-add 'Info-up :after 'recenter)

;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'org-mode-hook 'flyspell-mode)
(global-set-key (kbd "<f8>") 'flyspell-mode)

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

(unless (getenv "THEME")
  (setenv "THEME" "solarized-light"))

(setq inferior-lisp-program "/usr/bin/sbcl")

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'irony-mode-hook 'irony-eldoc)

(global-set-key (kbd "C-c s-c") 'compile)

(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode nil
              c-default-style "k&r")
;(setq tab-width 4
;      indent-tabs-mode t
;      c-default-style "k&r")

;(defvaralias 'c-basic-offset 'tab-width)

(defun kill-whole-word ()
  (interactive)
  (forward-char)
  (backward-word)
  (kill-word 1))

(defun copy-whole-line ()
  (interactive)
  (save-excursion
    (kill-new
     (buffer-substring
      (point-at-bol)
      (point-at-eol)))))

(global-subword-mode 1)

(setq electric-pair-pairs '(
                            (?\( . ?\))
                            (?\[ . ?\])
                            (?\{ . ?\})
                            ))
;;(electric-pair-mode t)

(show-paren-mode t)

(setq auto-save-default nil)

(setq
  backup-by-copying t                           ; us cp to backup files
  backup-directory-alist '(("." . "~/.saves"))  ; stop fs clutter
  delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(setq inhibit-startup-message t)

(line-number-mode 1)
(column-number-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

(when window-system (global-hl-line-mode t))

;; (when window-system (global-prettify-symbols-mode t))
;; (global-prettify-symbols-mode t)
;; (global-pretty-mode t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(use-package linum-relative
  :ensure t
  :config
  (setq linum-relative-current-symbol "")
  (add-hook 'prog-mode-hook 'linum-relative-mode))

(setq ring-bell-function 'ignore)

(setq scroll-conservatively 100)

(defun config-visit ()
  (interactive)
  (find-file "~/.emacs.d/config.org"))

(defun stumpwm-config ()
  (interactive)
  (find-file "~/.stumpwm.d/init.lisp"))

(defun config-reload ()
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

(setq display-time-24hr-format t)
(display-time-mode 1)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
;; (setq-default TeX-master nil) ; prompt for master file, useful for multi-documents
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-electric-sub-and-superscript t)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(setq TeX-PDF-mode t)

;; see https://superuser.com/a/902764
;; (TeX-global-PDF-mode t)
(setq latex-run-command "pdflatex")

(use-package mingus
  :ensure t
  :config
  ;; (add-to-list 'ivy-completing-read-handlers-alist '(mingus-query . nil))
  :bind
  ("s-m b" . mingus-browse)
  ("s-m p" . mingus))

(use-package emms
  :ensure t
  :config
    (require 'emms-setup)
    (require 'emms-player-mpd)
    (emms-all) ; don't change this to values you see on stackoverflow questions if you expect emms to work
    (setq emms-seek-seconds 5)
    (setq emms-player-list '(emms-player-mpd))
    (setq emms-info-functions '(emms-info-mpd))
    (setq emms-player-mpd-server-name "localhost")
    (setq emms-player-mpd-server-port "6600"))
    ;; ("s-m r" . emms-player-mpd-update-all-reset-cache)
(setq mpc-host "localhost:6600")

(defun mpd/update-database ()
  "Updates the MPD database synchronously."
  (interactive)
  (call-process "mpc" nil nil nil "update")
  (message "MPD Database Updated!"))
(global-set-key (kbd "s-m u") 'mpd/update-database)

(use-package paredit
  :ensure t
  :config
  (add-hook 'lisp-mode-hook 'paredit-mode)
  (add-hook 'scheme-mode-hook 'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode))

(use-package dmenu
  :ensure t
  :bind
  ("s-SPC" . 'dmenu))

(use-package smart-tabs-mode
  :ensure t
  :init
  (setq smart-tabs-mode nil)
  :config
  (smart-tabs-insinuate 'c 'c++ 'python))

(use-package ido-completing-read+
  :ensure t
  :config
  (ido-ubiquitous-mode 1))

(use-package easy-kill
  :ensure t
  :config (global-set-key [remap kill-ring-save] 'easy-kill))

(use-package expand-region
  :ensure t
  :bind ("C-=" . 'er/expand-region))

(use-package multiple-cursors
  :ensure t
  :bind
  ("s-q" . mc/mark-next-like-this)
  ("s-Q" . mc/unmark-next-like-this))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'flycheck-mode)
  (with-eval-after-load 'flycheck
    (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))) ; stop annoying "add comments!" warnings

(use-package stumpwm-mode
  :ensure t)

(use-package magit
  :ensure t)

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(use-package avy
  :ensure t
  :init
  (setq avy-background t)
  :bind
  ("s-f" . avy-goto-word-1)
  ("s-F" . avy-goto-char))

(use-package rainbow-mode
  :ensure t
  :init (add-hook 'prog-mode-hook 'rainbow-mode))

;; (use-package rainbow-delimiters
;;   :ensure t
;;   :init
;;   (rainbow-delimiters-mode t)
;;   (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;;   (add-hook 'geiser-repl-mode 'rainbow-delimiters-mode))

(use-package sudo-edit
  :ensure t)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq
   dashboard-items '((recents . 7)
                     (projects . 7))
   dashboard-banner-logo-title "Welcome to Emacs"))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  :init
  (add-hook 'prog-mode-hook 'company-mode))

(with-eval-after-load 'company
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "C-n") #'company-select-next)
    (define-key company-active-map (kbd "C-p") #'company-select-previous))

(use-package powerline
  :ensure t
  :init
  (powerline-default-theme))

(use-package diminish
  :ensure t
  :init
  (mapc 'diminish
        '(auto-revert-mode
          beacon-mode
          which-key-mode
          subword-mode
          rainbow-mode
          linum-relative-mode
          visual-line-mode
          global-guix-prettify-mode
          guix-prettify-mode
          org-indent-mode
          paredit-mode
          org-indent-mode
          eldoc-mode)))

(use-package symon
  :ensure t
  :bind
  ("C-s-h" . symon-mode))

(use-package popup-kill-ring
  :ensure t
  :bind
  ("M-y" . popup-kill-ring))

(use-package swiper
  :ensure t
  :bind
  ("C-s" . swiper))

(use-package projectile
  :ensure t
  :init
  (projectile-mode 1))

;; (use-package spaceline
;;   :ensure t
;;   :config
;;   (require 'spaceline-config)
;;   (setq powerline-default-separator (quote arrow))
;;   (spaceline-spacemacs-theme))

;; (use-package slime
  ;; :ensure t)

;; (use-package slime-company
  ;; :ensure t)

;; (slime-setup '(slime-company))

(use-package guix
  :ensure t
  :config
  (setq global-guix-prettify-mode t))

;; (use-package ido-vertical-mode ; disabled b/c of performance with ido-ubiquitous
;;   :ensure t
;;   :init
;;   (ido-vertical-mode 0)) 
;; (setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; (use-package treemacs ; not using this right now
;;   :ensure t
;;   :bind
;;   ("C-x \\" . 'treemacs-toggle))

(use-package switch-window ; don't need this now
  :ensure t
  :config
  (setq
   switch-window-input-style 'minibuffer
   switch-window-increase 4
   switch-window-threshold 2
   switch-window-shortcut-style 'qwerty
   switch-window-qwerty-shortcuts
   '("a" "s" "d" "f" "j" "k" "l"))
  :bind
  ([remap other-window] . switch-window))

(defvar my-term-shell "/usr/bin/zsh")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(defadvice term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)
(ad-activate 'term)

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq org-src-window-setup 'current-window)

(setq org-src-fontify-natively t)

;  ( org-src-tab-acts-natively t)

(add-to-list 'org-structure-template-alist
             '("l" "#+BEGIN_SRC lisp\n?\n#+END_SRC"))

(add-to-list 'org-structure-template-alist
             '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))

(add-to-list 'org-structure-template-alist
             '("sc" "#+BEGIN_SRC scheme\n?\n#+END_SRC"))

(add-to-list 'org-structure-template-alist
             '("py" "#+BEGIN_SRC python\n?\n#+END_SRC"))

(add-to-list 'org-structure-template-alist
             '("sh" "#+BEGIN_SRC sh\n?\n#+END_SRC"))

(add-to-list 'org-structure-template-alist
             '("cpp" "#+BEGIN_SRC cpp\n?\n#+END_SRC"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((lisp . t)
   (python . t)
   (gnuplot . t)))
(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "lisp"))
  (not (string= lang "emacs-lisp")))  ; don't ask for listed languages
(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate) ;; overwrite default

(add-hook 'org-mode-hook '(lambda () (visual-line-mode)))

(add-to-list 'org-agenda-files (expand-file-name "~/orgfiles"))

(add-hook 'org-mode-hook 'org-indent-mode)

(global-set-key (kbd "s-s") 'slime-selector)
(global-set-key (kbd "C-h H") 'slime-documentation-lookup)
;; (load (expand-file-name "/usr/lib/quicklisp/slime-helper.el"))
(add-to-list 'slime-contribs 'slime-fancy)
(add-to-list 'slime-contribs 'slime-banner)

;; For faster startup. SLIME manual 2.5.3.
(setq slime-lisp-implementations
      `((sbcl ("sbcl" "--core" ,(expand-file-name "~/.emacs.d/sbcl.core-for-slime")))))

;; Local HyperSpec copy. Use w3m.
(setq common-lisp-hyperspec-root (expand-file-name "~/.emacs.d/HyperSpec/"))
(setq slime-browse-url-browser-function 'w3m-browse-url)

;; Would like a cleaner way to do this, i.e. just wrap slime-hyperspec-lookup instead of making a copied definition...
(defun my-slime-hyperspec-lookup (symbol-name)
  "Identical to `slime-hyperspec-lookup' except we shadow `browse-url-browser-function'."
  (interactive (list (common-lisp-hyperspec-read-symbol-name
                      (slime-symbol-at-point))))
  (if slime-browse-url-browser-function
      (let ((browse-url-browser-function
             slime-browse-url-browser-function))
        (hyperspec-lookup symbol-name))
    (hyperspec-lookup symbol-name)))

(setq slime-documentation-lookup-function 'my-slime-hyperspec-lookup)

;; Chicken Scheme extension - broken
;; (add-to-list 'load-path (expand-file-name (directory-file-name "~/Builds/chicken-slime/swank-chicken/")))
;; (autoload 'chicken-slime "chicken-slime" "SWANK backend for Chicken" t)
;; (add-hook 'scheme-mode-hook 'slime-mode)

;; (eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
(defvar tramp-shell-prompt-pattern-default "\\(?:^\\|\\)[^]#$%>\n]*#?[]#$%>] *\\(\\[[0-9;]*[a-zA-Z] *\\)*")
(setf tramp-shell-prompt-pattern "\\(?:^\\|\\)[^]#$%>\n]*#?[]#$%>].* *\\(\\[[0-9;]*[a-zA-Z] *\\)*")

(add-to-list 'auto-mode-alist '("\\.pl$" . prolog-mode))
;; (define-key 'prolog-mode-map (kbd "C-x C-e") 'ediprolog-dwim)

(setq prolog-electric-if-then-else-flag t)
