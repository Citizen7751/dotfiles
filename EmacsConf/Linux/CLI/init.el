;;-------------------------------------------------------------------------
;; Cutsom Settings

;;Melpa
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;;PlantUML
(require 'plantuml-mode)
(setq plantuml-jar-path "~/.emacs.d/plantuml.jar")
(setq plantuml-default-exec-mode 'jar)


;; UTF-8
(prefer-coding-system 'utf-8) 
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-with-signature)


;;Editor
(menu-bar-mode -1)
(electric-pair-mode 1)
(global-display-line-numbers-mode t) 
(global-font-lock-mode t)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq c-basic-offset 4)


;;Keybingings
(global-set-key (kbd "C-c <down>") (lambda () (interactive) (enlarge-window 2)))
(global-set-key (kbd "C-c <up>") (lambda () (interactive) (shrink-window 2)))
(global-set-key (kbd "C-c <left>") (lambda () (interactive) (shrink-window-horizontally 2)))
(global-set-key (kbd "C-c <right>") (lambda () (interactive) (enlarge-window-horizontally 2)))
(global-set-key (kbd "M-n") (lambda () (interactive) (forward-paragraph)))
(global-set-key (kbd "M-p") (lambda () (interactive) (backward-paragraph)))
(global-set-key (kbd "C-c c") (lambda () (interactive) (find-file "~/.emacs.d/init.el")))


;;System
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq visible-bell t)
(setq debug-on-error t)
