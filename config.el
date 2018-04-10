
(global-set-key (kbd "C-x g o") 'mode-line-other-buffer)

;  (global-set-key "Alt_L" . "Super")

(global-set-key (kbd "C-r") 'isearch-forward)
(global-set-key (kbd "C-S-R") 'isearch-backward)

(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "<C-s-return>") 'ansi-term)

(global-set-key (kbd "C-x b") 'ibuffer)

(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

(global-set-key (kbd "C-c e") 'config-visit)
(global-set-key (kbd "C-c r") 'config-reload)

(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(global-set-key (kbd "C-c w w") 'kill-whole-word)

(global-set-key (kbd "C-c w l") 'copy-whole-line)

(global-set-key (kbd "C-x k") 'kill-current-buffer)

(global-set-key (kbd "C-M-s-k") 'kill-all-buffers)

(setq
 ido-enable-flex-matching nil
 ido-create-new-buffer 'always
 ido-everywhere 1)
(ido-mode 1)

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

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(defun kill-all-buffers ()
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

(global-set-key (kbd "s-c") 'compile)

(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode t)
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

(when window-system (global-prettify-symbols-mode t))

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

(defun config-reload ()
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

(setq display-time-24hr-format t)
(display-time-mode 1)

(use-package ido-completing-read+
  :ensure t
  :config
  (ido-ubiquitous-mode 1))

(use-package guix
  :ensure t
  :config
  (setq global-guix-prettify-mode t))

;; (use-package slime ; may want to install via other means
  ;; :ensure t)
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; (use-package geiser
;;   :ensure t)

(use-package expand-region
  :ensure t
  :bind ("C-S-q" . 'er/expand-region))

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

(use-package smart-tabs-mode
  :ensure t
  :init
  (setq smart-tabs-mode 1))

(use-package magit
  :ensure t
  :bind
  ("s-g" . magit-status))

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

(use-package rainbow-delimiters
  :ensure t
  :init
  (rainbow-delimiters-mode 1)
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'geiser-repl-mode 'rainbow-delimiters-mode))

(use-package sudo-edit
  :ensure t
  :bind ("C-c s" . sudo-edit))

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
  (add-hook 'after-init-hook 'global-company-mode))

(with-eval-after-load 'company
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "C-n") #'company-select-next)
    (define-key company-active-map (kbd "C-p") #'company-select-previous))

(powerline-vim-theme)

;; (use-package spaceline
;;   :ensure t
;;   :config
;;   (require 'spaceline-config)
;;   (setq powerline-default-separator (quote arrow))
;;   (spaceline-spacemacs-theme))

(use-package diminish
  :ensure t
  :init
  (diminish 'auto-revert-mode)
  (diminish 'beacon-mode)
  (diminish 'which-key-mode)
  (diminish 'subword-mode)
  (diminish 'rainbow-mode)
  (diminish 'linum-relative-mode)
  (diminish 'visual-line-mode)
  (diminish 'global-guix-prettify-mode)
  (diminish 'guix-prettify-mode)
  (diminish 'org-indent-mode))

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

;; (use-package ido-vertical-mode ; disabled b/c of performance with ido-ubiquitous
;;   :ensure t
;;   :init
;;   (ido-vertical-mode 0)) 
;; (setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; (use-package treemacs ; not using this right now
;;   :ensure t
;;   :bind
;;   ("C-x \\" . 'treemacs-toggle))

;; (use-package switch-window ; don't need this now
;;   :ensure t
;;   :config
;;   (setq
;;    switch-window-input-style 'minibuffer
;;    switch-window-increase 4
;;    switch-window-threshold 2
;;    switch-window-shortcut-style 'qwerty
;;    switch-window-qwerty-shortcuts
;;    '("a" "s" "d" "f" "j" "k" "l"))
;;   :bind
;;   ([remap other-window] . switch-window))

;; (use-package dmenu
;;   :ensure t
;;   :bind
;;   ("C-s-SPC" . 'dmenu))

(defvar my-term-shell "/usr/bin/zsh")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(setq org-src-window-setup 'current-window)

(setq org-src-fontify-natively t)

;  ( org-src-tab-acts-natively t)

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

;; (add-hook 'org-mode-hook '(lambda () (visual-line-mode)))

(add-to-list 'org-agenda-files (expand-file-name "~/orgfiles"))

(add-hook 'org-mode-hook 'org-indent-mode)
