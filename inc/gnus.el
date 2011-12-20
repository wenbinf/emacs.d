(setq user-mail-address "wenbin.org@gmail.com")
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