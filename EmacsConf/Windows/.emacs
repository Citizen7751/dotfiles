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

(require 'magit)
(require 'smex)
(require 'darkroom)
(require 'material-theme)
(require 'evil)

(require 'markdown-mode)
(require 'nasm-mode)

;; ----------------------------------------------------------------------
;;Editor

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(visual-line-mode)
(setq column-number-mode t)

;;IDO
(ido-mode 1)
(ido-everywhere 1)

(setq-default display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

;;Programming Mode
(setq-default fill-column 80)
(defun my/progmode-rice ()
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
;;(load-theme 'modus-vivendi t) ;; dark
;;(load-theme 'modus-operandi t) ;; light
(load-theme 'material t) ;; dark

(global-font-lock-mode t)
;;(set-frame-parameter (selected-frame) 'alpha '(90 . 90)) 

;; ----------------------------------------------------------------------
;;Keybingings

;;smex
(global-set-key (kbd "M-x") (lambda () (interactive) (smex)))

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

(global-set-key (kbd "C-c c") (lambda () (interactive) (find-file "~/.emacs")))
(global-set-key (kbd "C-c e") (lambda () (interactive) (evil-mode 1)))
(global-set-key (kbd "C-c w") (lambda () (interactive) (evil-mode 0)))
(global-set-key (kbd "C-c o") (lambda () (interactive) (overwrite-mode 1)))
(global-set-key (kbd "C-c p") (lambda () (interactive) (overwrite-mode 0)))
(global-set-key (kbd "C-,") (lambda () (interactive) (duplicate-line)))
(global-set-key (kbd "C-.") (lambda () (interactive) (copy-from-above-command)))

;;-------------------------------------------------------------------------
;;System

(setq inhibit-splash-screen t)
(setq confirm-kill-emacs 'yes-or-no-p)
(setq display-time-24hr-format t)
(setq calendar-week-start-day 1) ;;sunday = 0
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)
(setq visible-bell t)
;;(setq debug-on-error t)

(setq custom-file "~/.emacs.d/ecustom.el")
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(defun my/def_read_only () (read-only-mode 1))
(add-hook 'find-file-hook #'my/def_read_only)
