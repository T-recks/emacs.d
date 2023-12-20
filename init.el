(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Begin Source config.org

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; End Source config.org

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-engine 'xetex)
 '(TeX-view-program-selection
   '(((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Zathura")
     (output-html "xdg-open")))
 '(ansi-term-color-vector
   [term term-color-black term-color-red term-color-green term-color-yellow term-color-blue term-color-magenta term-color-cyan term-color-white] t)
 '(background-color "#111111")
 '(background-mode dark)
 '(beacon-color "#f2777a")
 '(browse-url-browser-function 'browse-url-firefox)
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(cursor-color "#cccccc")
 '(custom-enabled-themes (list (intern (getenv "THEME"))))
 '(custom-safe-themes
   '("4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "42b9d85321f5a152a6aef0cc8173e701f572175d6711361955ecfb4943fe93af" "3fa81193ab414a4d54cde427c2662337c2cab5dd4eb17ffff0d90bca97581eb6" default))
 '(desktop-path '("~"))
 '(desktop-save-mode t)
 '(diary-entry-marker 'font-lock-variable-name-face)
 '(emms-mode-line-icon-image-cache
   '(image :type xpm :ascent center :data "/* XPM */\12static char *note[] = {\12/* width height num_colors chars_per_pixel */\12\"    10   11        2            1\",\12/* colors */\12\". c #1fb3b3\",\12\"# c None s None\",\12/* pixels */\12\"###...####\",\12\"###.#...##\",\12\"###.###...\",\12\"###.#####.\",\12\"###.#####.\",\12\"#...#####.\",\12\"....#####.\",\12\"#..######.\",\12\"#######...\",\12\"######....\",\12\"#######..#\" };") t)
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(foreground-color "#cccccc")
 '(frame-background-mode 'dark)
 '(geiser-active-implementations '(guile racket chicken chez mit))
 '(geiser-default-implementation '\'guile)
 '(gnus-logo-colors '("#528d8d" "#c0c0c0") t)
 '(gnus-mode-line-image-cache
   '(image :type xpm :ascent center :data "/* XPM */\12static char *gnus-pointer[] = {\12/* width height num_colors chars_per_pixel */\12\"    18    13        2            1\",\12/* colors */\12\". c #1fb3b3\",\12\"# c None s None\",\12/* pixels */\12\"##################\",\12\"######..##..######\",\12\"#####........#####\",\12\"#.##.##..##...####\",\12\"#...####.###...##.\",\12\"#..###.######.....\",\12\"#####.########...#\",\12\"###########.######\",\12\"####.###.#..######\",\12\"######..###.######\",\12\"###....####.######\",\12\"###..######.######\",\12\"###########.######\" };") t)
 '(hl-paren-background-colors '("#e8fce8" "#c1e7f8" "#f8e8e8"))
 '(hl-sexp-background-color "#efebe9")
 '(irony-supported-major-modes '(c++-mode c-mode objc-mode arduino-mode))
 '(jdee-db-active-breakpoint-face-colors (cons "#000000" "#fd971f"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#000000" "#b6e63e"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#000000" "#525254"))
 '(magit-diff-use-overlays nil)
 '(notmuch-search-line-faces
   '(("unread" :foreground "#aeee00")
     ("flagged" :foreground "#0a9dff")
     ("deleted" :foreground "#ff2c4b" :bold t)))
 '(org-src-tab-acts-natively t)
 '(package-selected-packages
   '(geiser-racket org-journal fpp-mode tuareg oberon slime forth-mode flymake-python-pyflakes elpy markdown-mode sml-mode mentor php-mode arduino-mode ediprolog ivy-youtube auctex easy-kill rtags irony-eldoc irony elmacro gnuplot mingus corral simple-mpc emms arch-packer stumpwm-mode cider md4rd paredit w3m powerline guix ido-completing-read+ ido-reading-complete+ expand-region multiple-cursors solarized-theme nord-theme gruvbox-theme plan9-theme flycheck smart-tabs-mode noctilux-theme color-theme magit projectile linum-relative popup-kill-ring symon symbon diminish company dashboard rainbow-delimiters sudo-edit rainbow-mode avy smex ido-vertical-mode which-key use-package))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(rainbow-identifiers-choose-face-function 'rainbow-identifiers-cie-l*a*b*-choose-face t)
 '(rainbow-identifiers-cie-l*a*b*-color-count 1024 t)
 '(rainbow-identifiers-cie-l*a*b*-lightness 80 t)
 '(rainbow-identifiers-cie-l*a*b*-saturation 25 t)
 '(sml/active-background-color "#98ece8")
 '(sml/active-foreground-color "#424242")
 '(sml/inactive-background-color "#4fa8a8")
 '(sml/inactive-foreground-color "#424242")
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
