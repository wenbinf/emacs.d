
;; =====================================================================
;;                        Basic environment
;; =====================================================================

;; Formatting
(setq-default fill-column 80)
(setq auto-fill-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(setq standard-indent 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

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
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'load-path "~/.emacs.d/plugins")

;; Auto completion for coding
(require 'yasnippet)
(yas-global-mode 1)

;; Color theme
(load-file "~/.emacs.d/plugins/color-theme.el")
(require 'color-theme)
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

;; cscope
(require 'xcscope)

;; Auto completion
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/ac-dict")
(ac-config-default)
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(add-to-list 'ac-sources 'ac-source-yasnippet)
(global-auto-complete-mode t)
(setq ac-auto-start 2)
(setq ac-ignore-case nil)

;; Enforce formating code at edit-time
(load "editorconfig")

;; Code folding
(add-hook 'js-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
            ;; Activate the folding mode
            (hs-minor-mode t)))
; c-c @ c-h to hide
; c-c @ c-s to show
(global-set-key (kbd "") 'hs-show-block)
(global-set-key (kbd "") 'hs-show-all)
(global-set-key (kbd "") 'hs-hide-block)
(global-set-key (kbd "") 'hs-hide-all)

;; m-x run-js
(require 'js-comint)
(setq inferior-js-program-command "node")
(setq inferior-js-mode-hook
      (lambda ()
        (ansi-color-for-comint-mode-on)
        (add-to-list 'comint-preoutput-filter-functions
                     (lambda (output)
                       (replace-regexp-in-string ".*1G\.\.\..*5G" "..."
                                                 (replace-regexp-in-string ".*1G.*3G" "&gt;" output))
                       ))))
(require 'js2-mode)
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))


(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

