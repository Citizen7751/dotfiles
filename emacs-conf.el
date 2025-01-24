(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(auctex gruber-darker-theme evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;-------------------------------------------------------------------------

;; Saját beállítások


;; UTF-8

;; Alapértelmezett kódolás beállítása UTF-8-ra
(prefer-coding-system 'utf-8) 
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)

;; Mindig UTF-8-at használjon, ha nem egyértelmű a kódolás
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;;UTF-8 BOM a fájlokhoz
(setq-default buffer-file-coding-system 'utf-8-with-signature)

;;-------------------------------------------------------------------------

;;Editor

(tool-bar-mode -1) ;; Eszköztár elrejtése
(menu-bar-mode -1) ;; Menüsor elrejtése
(scroll-bar-mode -1) ;; Görgetősáv elrejtése
(global-display-line-numbers-mode t) ;; Sorok számozása
(setq column-number-mode t) ;; Oszlopszám megjelenítése a státusz sorban

;;Témák
;;(load-theme 'wheatgrass t) ;;alap
(load-theme 'modus-vivendi t) ;;alap 2
;;(load-theme 'tango-dark t) ;;világosabb

;;Sorok számozása globálisan
(global-display-line-numbers-mode t) 

;;Szintaxis kiemelés
(global-font-lock-mode t)

;;Idejön az átlátszó háttér
(set-frame-parameter (selected-frame) 'alpha '(90 . 90)) 


;;Keybingingok
(global-set-key (kbd "C-c <down>") (lambda () (interactive) (enlarge-window 2)))
(global-set-key (kbd "C-c <up>") (lambda () (interactive) (shrink-window 2)))
(global-set-key (kbd "C-c <left>") (lambda () (interactive) (shrink-window-horizontally 2)))
(global-set-key (kbd "C-c <right>") (lambda () (interactive) (enlarge-window-horizontally 2)))
;;-------------------------------------------------------------------------

;;Rendszerszintű egyéb

(setq make-backup-files nil) ;;Ne készítsen mentés ellőtti másolatokat
(setq auto-save-default nil) ;;Ne készítsen automatikus mentési fájlokat

(setq ring-bell-function 'ignore) ;;Teljesen kikapcsolja a hangjelzést
(setq visible-bell t) ;;Hangjelzés helyett vizuális villanás
