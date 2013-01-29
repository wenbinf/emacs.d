;; =====================================================================
;;                        Basic environment
;; =====================================================================

;; Lines and Columns
(setq-default fill-column 80)
(setq auto-fill-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(setq standard-indent 4)
(setq default-tab-width 4)

;; Place Backup Files in Specific Directory
(setq make-backup-files t)
(setq version-control t)
(setq delete-old-versions t)
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/backup"))))

;; GUI
(if window-system (mouse-wheel-mode t))
(setq scroll-step 1)
(if window-system (menu-bar-mode 1) (menu-bar-mode 0))
(auto-image-file-mode)

;; Buffer
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(setq default-major-mode 'text-mode)
;(global-font-lock-mode t)
(setq inhibit-startup-message t)

;; Theme
(add-to-list 'default-frame-alist '(font . "Mono-14"))

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
;(color-theme-dark-laptop)
;(require 'highlight-current-line)
;(highlight-current-line-on t)
;(set-face-background 'highlight-current-line-face "blue")
(if window-system (color-theme-dark-laptop))

;; Org mode
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))
(add-to-list 'org-export-latex-classes
             '("res"
               "\\documentclass{res}"
               ("\\subfsection{%s}" . "\\subsection{%s}")
			   ("\\subsubsection{%s}" . "\\subsubsection{%s}")))  
(setq org-export-html-postamble nil)

;; Gnus
;; (load-file "~/.emacs.d/plugins/gnus.el")

;; cscope
(require 'xcscope)

;; google c style
(load-file "~/.emacs.d/plugins/google-c-style.el")
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
(add-hook 'c++-mode-common-hook 'google-set-c-style)
(add-hook 'c++-mode-common-hook 'google-make-newline-indent)

;; beautify code
(defun clean-code ()
	(interactive)
;	(mark-whole-buffer)
;	(align-entire 'beginning-of-buffer 'end-of-buffer)
;	(delete-trailing-whitespace)
;	(mark-whole-buffer)
;	(untabify)
)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(graphviz-dot-preview-extension "svg")
 '(graphviz-dot-view-command "doted %s"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
