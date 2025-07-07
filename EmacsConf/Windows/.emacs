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

;;(setq package-check-signature nil)

(use-package magit :ensure t :config)
(use-package smex :ensure t :config)
(use-package darkroom :ensure t :config)
(use-package evil :ensure t :config)
(use-package multiple-cursors :ensure t :config)
(use-package auctex :ensure t :config)
(use-package markdown-mode :ensure t :config)
(use-package nasm-mode :ensure t :config)
(use-package zone-tmux-clock :ensure t :config)
(use-package cobol-mode :ensure t :config)
(use-package eglot :ensure t)
(use-package gdb-mi :ensure t)
(use-package company
  :ensure t
  :init
  (global-company-mode)
  :config
;;  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 1))

;;-------------------------------------------------------------------------
;;Custom functions

(defun my/progmode-rice ()
  (display-fill-column-indicator-mode 1)
  (display-line-numbers-mode 1)
  ;;(electric-pair-mode 1)
  )

(defun my/def_read_only () (read-only-mode 1))

;; ----------------------------------------------------------------------
;;Editor

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(global-visual-line-mode t)
(setq column-number-mode t)

;;IDO
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(setq-default confirm-nonexistent-file-or-buffer nil)
(ido-mode 1)

(setq-default display-line-numbers-type 'absolute)
;;(setq-default display-line-numbers-type 'relative)
;;(global-display-line-numbers-mode 1)

;;Programming Mode
(setq-default fill-column 80)
(add-hook 'prog-mode-hook #'my/progmode-rice)

(display-time)
(display-battery-mode)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq c-basic-offset 4)
(setq basic-offset 4)

;;Company
(setq company-dabbrev-other-buffers nil)
(setq company-dabbrev-downcase nil)
(setq dabbrev-abbrev-char-regexp "[^[:space:]]+")

;;UI Customization
(load-theme 'modus-vivendi t) ;; dark
;;(load-theme 'modus-operandi t) ;; light

(global-font-lock-mode t)
;;(set-frame-font "fixedsys") ;; DOS style on Windows
;;(set-frame-font "Edwardian Script ITC") ;; Medieval style on Windows

(set-frame-parameter (selected-frame) 'alpha '(90 . 90)) 

;; ----------------------------------------------------------------------
;;Literate programming within Org-Mode with C and Python

(require 'ob-C)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (C . t)
   (python . t)))

;;For C

;;Compilers
(setq org-babel-C-compiler "gcc -Wall -Wextra -std=c17") ;;Plain GCC
;;(setq org-babel-C-compiler "clang -Wall -Wextra") ;;plain Clang
;;(setq org-babel-C-compiler "x86_64-w64-mingw32-gcc -Wall -Wextra") ;;Posix C in Windows

(setq org-confirm-babel-evaluate nil)
(setq org-babel-C-verbose nil)
;;(add-to-list 'org-babel-tangle-lang-exts '("C" . "c"))

;;For Python
(setq org-babel-python-command "python3")

;; ----------------------------------------------------------------------
;; LaTeX with AUCTex

(setq TeX-engine 'default)
(setq TeX-parse-self t)
(setq TeX-PDF-mode t)

(add-hook 'LaTeX-mode-hook #'visual-line-mode)
(add-hook 'LaTeX-mode-hook #'flyspell-mode)
(add-hook 'LaTeX-mode-hook #'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook #'turn-on-reftex)
(add-hook 'LaTeX-mode-hook #'TeX-source-correlate-mode)

(setq TeX-source-correlate-start-server t)
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-method 'synctex)

;; ----------------------------------------------------------------------
;;Keybingings

;;smex
(global-set-key (kbd "M-x") (lambda () (interactive) (smex)))

;;Multiple Cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;Autocomplete
(global-set-key (kbd "C-<tab>") 'company-complete)

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
(global-set-key (kbd "C-c z") (lambda () (interactive) (zone-tmux-clock-preview)))
(global-set-key (kbd "C-.") (lambda () (interactive) (duplicate-line)))
(global-set-key (kbd "M-,") (lambda () (interactive) (copy-from-above-command)))

;;Beginning - End of buffer
(global-set-key (kbd "C-x <down>") (lambda () (interactive) (end-of-buffer)))
(global-set-key (kbd "C-x <up>") (lambda () (interactive) (beginning-of-buffer)))

;;-------------------------------------------------------------------------
;;System

(setq inhibit-splash-screen t)
(setq initial-scratch-message ;;nil
"\
;; ⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣄
;; ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⡀                      ⣠⣷⣦⣄
;; ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣶⣿⣿⣿⣿⠏
;; ⠀⠀⠀⣠⣶⣤⣀⣀⣠⣼⣿⠿⠛⠋⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠙⠛⠿⣿⣿⣿⡟
;; ⠀⠀⣰⣿⣿⣿⣿⣿⡿⠋⣡⡴⠞⠛⠋⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠉⠙⠛⠳⢦⣄⠙⢿⣷⣀
;; ⠀⠀⠈⠙⢿⣿⣿⠟⢠⡾⠁⠀<==> Welcome to the <==> ⠈⢷⡄⠻⣿⣿⣿⣿⣿⡆
;; ⠀⠀⠀⠀⠈⣿⡟⠀⣾⠁⠀⠀╦ ╦┌─┐┬─┐┬┌─┌─┐┬ ┬┌─┐┌─┐   ⢿⡀⢻⣿⣿⣿⣿⣷
;; ⠀⠀⠀⢀⣼⣿⡇⢸⡇⠀⠀⠀║║║│ │├┬┘├┴┐└─┐├─┤│ │├─┘   ⢸⡇⢸⣿⡿⠋
;; ⠀⢶⣾⣿⣿⣿⣧⠀⣷⠀⠀⠀╚╩╝└─┘┴└─┴ ┴└─┘┴ ┴└─┘┴    ⠀⣼⠁⣸⣿⡀
;; ⠀⠸⣿⣿⣿⣿⣿⣆⠘⣧⡀ <======================> ⢀⣼⠃⣰⣿⣿⣷⣄
;; ⠀⠀⠉⠀ ⠀⠀⠙⢿⣷⣌⠛⠶⣤⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣤⡴⠛⣡⣾⣿⣿⣿⣿⣿⡟
;; ⠀⠀⠀⠀ ⠀⠀ ⠀⢸⣿⣿⣷⣦⣄⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣠⣴⣾⡿⠛⠋⠛⠻⢿⠏
;; ⠀⠀⠀⠀ ⠀ ⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
;; ⠀⠀⠀⠀   ⠀⠈⠛⠿⣿⠏                    ⠙⣿⣿⣿⣿⡄
;; ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                        ⠙⠛⠋⠉

")

;;(setq use-short-answers t)
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
(add-hook 'find-file-hook #'my/def_read_only)
