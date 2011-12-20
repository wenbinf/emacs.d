;; =====================================================================
;;                        Basic environment
;; =====================================================================

;; Lines and Columns
(setq-default fill-column 80)
(setq auto-fill-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(setq standard-indent 2)
(global-hl-line-mode 1)
(setq default-tab-width 2)

;; Place Backup Files in Specific Directory
(setq make-backup-files t)
(setq version-control t)
(setq delete-old-versions t)
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/backup"))))

;; GUI
(mouse-wheel-mode t)
(setq scroll-step 1)
(tool-bar-mode 0)
(menu-bar-mode 0)
(auto-image-file-mode)

;; Buffer
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(setq default-major-mode 'text-mode)
(global-font-lock-mode t)
(setq inhibit-startup-message t)

;; Theme
(add-to-list 'default-frame-alist '(font . "Mono-16"))

;; Programming
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; =====================================================================
;;                          Plugin
;; =====================================================================
(add-to-list 'load-path "~/.emacs.d/plugins")

;; Auto completion for coding
(require 'yasnippet-bundle)

;; Dot thing
(load-file "~/.emacs.d/plugins/graphviz-dot-mode.el")

;; Color theme
(load-file "~/.emacs.d/plugins/color-theme.el")
(require 'color-theme)
(color-theme-dark-laptop)