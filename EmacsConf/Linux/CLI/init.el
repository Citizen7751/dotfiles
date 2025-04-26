;; UTF-8

(prefer-coding-system 'utf-8) 
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-with-signature)

;; ----------------------------------------------------------------------
;;Melpa

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'magit)
(require 'smex)
(require 'evil)
(require 'plantuml-mode)


;; ----------------------------------------------------------------------
;;Custom functions

(defun my/progmode ()
  (display-fill-column-indicator-mode 1)
  (electric-pair-mode 1))

(defun my/def-read-only() (read-only-mode 1))

;; ----------------------------------------------------------------------
;;Editor

(menu-bar-mode -1)
(global-font-lock-mode t)
(visual-line-mode)
(setq column-number-mode t)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq-default display-line-numbers-type 'relative)
(global-display-line-numbers-mode 1)

(setq-default fill-column 80)
(add-hook 'prog-mode-hook #'my/progmode)

;;IDO
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(setq-default confirm-nonexistent-file-or-buffer nil)
(ido-mode 1)

(display-time)
(display-battery-mode)

;;PlantUML
(setq plantuml-jar-path "~/.emacs.d/outer_progs/plantuml.jar")
(setq plantuml-default-exec-mode 'jar)

;; ----------------------------------------------------------------------
;;Keybingings

(global-set-key (kbd "M-x") (lambda () (interactive) (smex)))
(global-set-key (kbd "C-c <down>") (lambda () (interactive) (enlarge-window 2)))
(global-set-key (kbd "C-c <up>") (lambda () (interactive) (shrink-window 2)))
(global-set-key (kbd "C-c <left>") (lambda () (interactive) (shrink-window-horizontally 2)))
(global-set-key (kbd "C-c <right>") (lambda () (interactive) (enlarge-window-horizontally 2)))

(global-set-key (kbd "M-n") (lambda () (interactive) (forward-paragraph)))
(global-set-key (kbd "M-p") (lambda () (interactive) (backward-paragraph)))

(global-set-key (kbd "C-c c") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(global-set-key (kbd "C-c e") (lambda () (interactive) (evil-mode 1)))
(global-set-key (kbd "C-c w") (lambda () (interactive) (evil-mode 0)))
(global-set-key (kbd "C-c o") (lambda () (interactive) (overwrite-mode 1)))
(global-set-key (kbd "C-c p") (lambda () (interactive) (overwrite-mode 0)))
(global-set-key (kbd "C-,") (lambda () (interactive) (duplicate-line)))
(global-set-key (kbd "M-,") (lambda () (interactive) (copy-from-above-command)))

;; ----------------------------------------------------------------------
;;System

(setq inhibit-splash-screen t)
(setq initial-scratch-message ";; Scratch Buffer

")
(setq confirm-kill-emacs 'yes-or-no-p)
(setq display-time-24hr-format t)
(setq calendar-week-start-day 1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq visible-bell t)
;;(setq debug-on-error t)
(put 'uppercase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(add-hook 'find-file-hook #'my/def-read-only)
(setq custom-file "~/.emacs.d/ecustom.el")
