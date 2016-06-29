(provide 'mu4erc)
(require 'mu4e)
(require 'org-mu4e)

(add-to-list 'mu4e-view-actions
	     '("ViewInBrowser" . mu4e-action-view-in-browser) t)

(setq mu4e-maildir "~/.mail/fillbrim")
(setq mu4e-drafts-folder "/Drafts")
(setq mu4e-sent-folder "/Sent")
(setq mu4e-trash-folder "/Trash")

(setq mu4e-sent-messages-behavior 'delete)

(setq org-mu4e-link-query-in-headers-mode nil)

(setq mu4e-maildir-shortcuts
    '( ("/Inbox"               . ?i)
       ("/Sent"   . ?s)
       ("/Trash"       . ?t)
       ("/Mbox"    . ?m)
       ("/BCBSG"   . ?b)
       ("/Promotion" . ?p)
       ("/Newsletter" . ?n)
       ("/Mailist"    . ?l)
       ("/Finance"    . ?f)
       ))


(setq mu4e-headers-fields
      '((:human-date . 11)
        (:flags . 5)
        (:mailing-list . 13)
        (:from-or-to . 20)
        (:subject)))


(setq mu4e-get-mail-command "mbsync fillbrim"
      mu4e-update-interval 900)

(setq mu4e-user-mail-address-list (list "guyijia@ccs.neu.edu" "guyijia@fillbrim.com" "guyijia@gmail.com"))

(setq
   user-mail-address "guyijia@ccs.neu.edu"
   user-full-name  "Yijia Gu"
   mu4e-compose-signature
    (concat
      "Best\n"
      "Yijia\n"))

(setq message-kill-buffer-on-exit t)
(setq mu4e-use-fancy-chars t)

(setq
 mu4e-view-show-images t)
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(setq mu4e-headers-include-related  t)
;; sending mail
(setq message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program "/usr/bin/msmtp"
      user-full-name "Yijia Gu")

(setq mu4e-confirm-quit nil
      mu4e-headers-date-format "%d/%b/%Y %H:%M" ; date format
      mu4e-html2text-command "html2text -utf8 -width 72"
      )

;; Borrowed from http://ionrock.org/emacs-email-and-mu.html
;; Choose account label to feed msmtp -a option based on From header
;; in Message buffer; This function must be added to
;; message-send-mail-hook for on-the-fly change of From address before
;; sending message since message-send-mail-hook is processed right
;; before sending message.
(defun choose-msmtp-account ()
  (if (message-mail-p)
      (save-excursion
        (let*
            ((from (save-restriction
                     (message-narrow-to-headers)
                     (message-fetch-field "from")))
             (account
              (cond
               ((string-match "guyijia@gmail.com" from) "gmail")
               ((string-match "guyijia@fillbrim.com" from) "fillbrim")
               ((string-match "guyijia@ccs.neu.edu" from) "fillbrim"))))
          (setq message-sendmail-extra-arguments (list '"-a" account))))))
(setq message-sendmail-envelope-from 'header)
(add-hook 'message-send-mail-hook 'choose-msmtp-account)

(add-hook 'mu4e-compose-pre-hook
          (defun my-set-from-address ()
            "Set the From address based on the To address of the original."
            (let ((msg mu4e-compose-parent-message)) ;; msg is shorter...
              (if msg
                  (setq user-mail-address
                        (cond
                         ((mu4e-message-contact-field-matches msg :to "guyijia@ccs.neu.edu")
                          "guyijia@ccs.neu.edu")
                         ((mu4e-message-contact-field-matches msg :to "@husky.neu.edu")
                          "guyijia@ccs.neu.edu")
                         ((mu4e-message-contact-field-matches msg :to "guyijia@gmail.com")
                          "guyijia@guyijia.com")
                         (t "guyijia@fillbrim.com")))))))
