(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(modus-vivendi))
 '(custom-safe-themes
   '("75b371fce3c9e6b1482ba10c883e2fb813f2cc1c88be0b8a1099773eb78a7176" "5aedf993c7220cbbe66a410334239521d8ba91e1815f6ebde59cecc2355d7757" "18a1d83b4e16993189749494d75e6adb0e15452c80c431aca4a867bcc8890ca9" "d5fd482fcb0fe42e849caba275a01d4925e422963d1cd165565b31d3f4189c87" "51fa6edfd6c8a4defc2681e4c438caf24908854c12ea12a1fbfd4d055a9647a3" "5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d" "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378" default))
 '(package-selected-packages
   '(markdown-mode evil nasm-mode plantuml-mode cmake-project cmake-mode auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(add-to-list 'package-archives 
    '("melpa" .
      "https://melpa.org/packages/"))
(package-initialize)


;; UTF-8
(set-language-environment "UTF-8")
(setq locale-coding-system 'utf-8)
(prefer-coding-system 'utf-8) 
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)

(setq-default buffer-file-coding-system 'utf-8)

(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;;Editor
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-display-line-numbers-mode t)
(setq column-number-mode t)
(electric-pair-mode 1)

(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq c-basic-offset 4)


(add-to-list 'load-path "~/.emacs.d/elpa/evil-20250121.1800/")
(require 'evil)

(add-to-list 'load-path "~/.emacs.d/elpa/nasm-mode-20240610.1505/")
(require 'nasm-mode)

;;Themes
(load-theme 'modus-vivendi t)
;;(load-theme 'modus-operandi t)
(require 'gruvbox-theme)
;;(load-theme 'gruvbox-dark-hard t)


(global-display-line-numbers-mode t) 
(global-font-lock-mode t)
(set-frame-parameter (selected-frame) 'alpha '(95 . 95)) 

;;Keybingings
(global-set-key (kbd "C-c <down>") (lambda () (interactive) (enlarge-window 2)))
(global-set-key (kbd "C-c <up>") (lambda () (interactive) (shrink-window 2)))
(global-set-key (kbd "C-c <left>") (lambda () (interactive) (shrink-window-horizontally 2)))
(global-set-key (kbd "C-c <right>") (lambda () (interactive) (enlarge-window-horizontally 2)))

(global-set-key (kbd "M-n") (lambda () (interactive) (forward-paragraph)))
(global-set-key (kbd "M-p") (lambda () (interactive) (backward-paragraph)))

(global-set-key (kbd "C-c c") (lambda () (interactive) (find-file "~/.emacs")))
(global-set-key (kbd "C-c e") (lambda () (interactive) (evil-mode 1)))
(global-set-key (kbd "C-c w") (lambda () (interactive) (evil-mode 0)))

;;-------------------------------------------------------------------------
;;System

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)
(setq visible-bell t)
;;(setq debug-on-error t)
