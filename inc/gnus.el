;; Get mail
(setq user-mail-address "wenbin@cs.wisc.edu")
(setq user-full-name "Wenbin Fang")
(load-library "smtpmail")
(load-library "nnimap")
(load-library "starttls")
(setq gnus-select-method '(nnimap "mail"
           (nnimap-address "imap.gmail.com")
           (nnimap-server-port 993)
           (nnimap-authinfo-file "~/.emacs.d/authinfo")
           (nnimap-stream ssl)))

(setq gnus-ignored-newsgroups "")
(add-hook 'gnus-topic-mode-hook 'gnus-topic-mode)
(setq gnus-permanently-visible-groups "mail")

;; Send mail
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "wenbin.org@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      starttls-use-gnutls t)