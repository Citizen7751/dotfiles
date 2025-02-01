(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(plantuml-mode cmake-project cmake-mode auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;-------------------------------------------------------------------------
;; Cutstom settings

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

;;Themes
;;(load-theme 'modus-vivendi t)
(require 'gruvbox-theme)
(load-theme 'gruvbox-dark-hard t)

(global-display-line-numbers-mode t) 
(global-font-lock-mode t)
;;(set-frame-parameter (selected-frame) 'alpha '(95 . 95)) 

;;Keybingings
(global-set-key (kbd "C-c <down>") (lambda () (interactive) (enlarge-window 2)))
(global-set-key (kbd "C-c <up>") (lambda () (interactive) (shrink-window 2)))
(global-set-key (kbd "C-c <left>") (lambda () (interactive) (shrink-window-horizontally 2)))
(global-set-key (kbd "C-c <right>") (lambda () (interactive) (enlarge-window-horizontally 2)))
(global-set-key (kbd "M-n") (lambda () (interactive) (forward-paragraph)))
(global-set-key (kbd "M-p") (lambda () (interactive) (backward-paragraph)))
(global-set-key (kbd "C-c c") (lambda () (interactive) (find-file "~/.emacs")))

;;-------------------------------------------------------------------------
;;System

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)
(setq visible-bell t)
;;(setq debug-on-error t)
