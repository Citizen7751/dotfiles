(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(amber-glow))
 '(custom-safe-themes
   '("0a076beea7570c3047225baf40783d7ce1576b8b98cdcd3e5622808875ab8c00" "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd" "9787282bf569ba5ef25eed52e2b475cb9a38061b7edd467635587effbe3c92ac" "75b371fce3c9e6b1482ba10c883e2fb813f2cc1c88be0b8a1099773eb78a7176" "5aedf993c7220cbbe66a410334239521d8ba91e1815f6ebde59cecc2355d7757" "18a1d83b4e16993189749494d75e6adb0e15452c80c431aca4a867bcc8890ca9" "d5fd482fcb0fe42e849caba275a01d4925e422963d1cd165565b31d3f4189c87" "51fa6edfd6c8a4defc2681e4c438caf24908854c12ea12a1fbfd4d055a9647a3" "5a0ddbd75929d24f5ef34944d78789c6c3421aa943c15218bac791c199fc897d" "8363207a952efb78e917230f5a4d3326b2916c63237c1f61d7e5fe07def8d378" default))
 '(package-selected-packages
   '(emms magit darkroom org markdown-mode evil nasm-mode cmake-project cmake-mode auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ----------------------------------------------------------------------
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

;; ----------------------------------------------------------------------
;; Packages

(require 'package)
(add-to-list 'package-archives 
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elpa/markdown-mode-20250115.1658/")
(add-to-list 'load-path "~/.emacs.d/elpa/evil-20250121.1800/")
(add-to-list 'load-path "~/.emacs.d/elpa/nasm-mode-20240610.1505/")
(add-to-list 'load-path "~/.emacs.d/elpa/magit-20250319.2218/")
(add-to-list 'load-path "~/.emacs.d/elpa/darkroom-0.3/")

(require 'markdown-mode)
(require 'evil)
(require 'nasm-mode)
(require 'magit)
(require 'darkroom)

;; ----------------------------------------------------------------------
;;Editor

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(visual-line-mode 1)
(setq column-number-mode t)

;;Programming Mode
(setq-default fill-column 80)
(defun my/progmode-rice ()
  (display-line-numbers-mode 1)
  (display-fill-column-indicator-mode 1))
  (electric-pair-mode 1)
(add-hook 'prog-mode-hook #'my/progmode-rice)

(display-time)
(display-battery-mode)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq basic-offset 4)

;;UI Customization
(load-theme 'modus-vivendi t) ;; dark
;;(load-theme 'modus-operandi t) ;; light

(global-font-lock-mode t)
;;(set-frame-parameter (selected-frame) 'alpha '(90 . 90)) 

;; ----------------------------------------------------------------------
;;Keybingings

;;Moving Windows
(global-set-key (kbd "C-c <down>") (lambda () (interactive) (enlarge-window 2)))
(global-set-key (kbd "C-c <up>") (lambda () (interactive) (shrink-window 2)))
(global-set-key (kbd "C-c <left>") (lambda () (interactive) (shrink-window-horizontally 2)))
(global-set-key (kbd "C-c <right>") (lambda () (interactive) (enlarge-window-horizontally 2)))
(global-set-key (kbd "C-c C-<down>") (lambda () (interactive) (enlarge-window 2)))
(global-set-key (kbd "C-c C-<up>") (lambda () (interactive) (shrink-window 2)))
(global-set-key (kbd "C-c C-<left>") (lambda () (interactive) (shrink-window-horizontally 2)))
(global-set-key (kbd "C-c C-<right>") (lambda () (interactive) (enlarge-window-horizontally 2)))

(global-set-key (kbd "M-n") (lambda () (interactive) (forward-paragraph)))
(global-set-key (kbd "M-p") (lambda () (interactive) (backward-paragraph)))

(global-set-key (kbd "C-c C-n") (lambda () (interactive) (beginning-of-buffer)))
(global-set-key (kbd "C-c C-m") (lambda () (interactive) (end-of-buffer)))

(global-set-key (kbd "C-c c") (lambda () (interactive) (find-file "~/.emacs")))
(global-set-key (kbd "C-c e") (lambda () (interactive) (evil-mode 1)))
(global-set-key (kbd "C-c w") (lambda () (interactive) (evil-mode 0)))
(global-set-key (kbd "C-c o") (lambda () (interactive) (overwrite-mode 1)))
(global-set-key (kbd "C-c p") (lambda () (interactive) (overwrite-mode 0)))
;;(global-set-key (kbd "C-c C-r") (lambda () (interactive) (replace-string)))

;;-------------------------------------------------------------------------
;;System

(setq confirm-kill-emacs 'yes-or-no-p)
(setq display-time-24hr-format t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)
(setq visible-bell t)
;;(setq debug-on-error t)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(defun my/def_read_only () (read-only-mode 1))
(add-hook 'find-file-hook #'my/def_read_only)
