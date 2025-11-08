;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(bazel eat elfeed gptel magit markdown-mode
	   markdown-preview-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun indent-whole-buffer ()
  "Indent the entire buffer without affecting point or mark."
  (interactive)
  (save-excursion
    (save-restriction
      (indent-region (point-min) (point-max)))))

(global-set-key (kbd "C-c i") 'indent-whole-buffer)
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(setq org-startup-with-inline-images t)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)))
(setq org-ditaa-jar-path "/usr/share/java/ditaa/ditaa-0.11.jar") ; Update with the actual path

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package gptel
  :ensure t
  :init
  (message "gptel :init block executing")
  :config
  (message "gptel :config block executing")
  (setq gptel-backend (gptel-make-anthropic "Claude"
                        :stream t
                        :key (getenv "ANTHROPIC_API_KEY")))
  (setq gptel-model "claude-sonnet-4-20250514")
  (setq gptel-use-markdown t)
  (message "gptel backend configured: %s" gptel-backend)
  ;; (setq gptel-default-mode 'org-mode)  ; Use org-mode for gptel buffers
  :bind (:map gptel-mode-map
              ("C-c C-n" . gptel-end-of-response)
              ("C-c C-p" . gptel-beginning-of-response)))

(use-package elfeed
  :ensure t
  :config
  ;; Load feeds from private file
  (setq elfeed-feeds-file "~/.emacs.d/elfeed-feeds.el")
  (when (file-exists-p elfeed-feeds-file)
    (load elfeed-feeds-file))
  
  ;; :bind ("C-x w" . elfeed)
  )

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "markdown"))

(use-package markdown-preview-mode
  :ensure t
  :after markdown-mode
  :config
  ;; Use your preferred browser for preview
  (setq markdown-preview-javascript
        (list "http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-MML-AM_CHTML"))
  
  ;; Optional: Auto-update preview on save
  (setq markdown-preview-auto-open t)
  
  ;; Keybinding for quick preview
  :bind (:map markdown-mode-map
              ("C-c C-c p" . markdown-preview-mode)))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package eat
  :ensure t
  :config
  ;; For `eat-eshell-mode'
  (add-hook 'eshell-load-hook #'eat-eshell-mode)
  
  ;; For `eat-eshell-visual-command-mode'
  (add-hook 'eshell-load-hook #'eat-eshell-visual-command-mode)
  
  :bind
  ("C-c t" . eat)  ; Launch terminal
  )

(use-package bazel
  :ensure t)
