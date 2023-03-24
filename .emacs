;; Load my configuration files
(add-to-list 'load-path (expand-file-name "~/.emacs.d/sitelisp"))
(load-file "~/.emacs.d/sitelisp/ProofGeneral-4.2/generic/proof-site.el")
(require 'custom_base)
(require 'custom_org)
(require 'mu4erc)
;; Customize Color theme
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-subtle-hacker)


;; Open crypt tool
(require 'epa-file)
(epa-file-enable)

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))


(package-initialize)
(load-theme 'zenburn t)

;; (load-file "~/.emacs.d/sitelisp/emacs-haskell-config/init.el")
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(haskell-complete-module-preferred (quote ("Data.ByteString" "Data.ByteString.Lazy" "Data.Conduit" "Data.Function" "Data.List" "Data.Map" "Data.Maybe" "Data.Monoid" "Data.Ord")))
;;  '(haskell-interactive-mode-eval-mode (quote haskell-mode))
;;  '(haskell-interactive-mode-eval-pretty nil)
;;  '(haskell-interactive-mode-include-file-name nil)
;;  '(haskell-notify-p t)
;;  '(haskell-process-args-cabal-repl (quote ("--ghc-option=-ferror-spans" "--with-ghc=ghci-ng")))
;;  '(haskell-process-args-ghci (quote ("-ferror-spans")))
;;  '(haskell-process-auto-import-loaded-modules t)
;;  '(haskell-process-generate-tags nil)
;;  '(haskell-process-log t)
;;  '(haskell-process-path-ghci "ghci-ng")
;;  '(haskell-process-reload-with-fbytecode nil)
;;  '(haskell-process-suggest-haskell-docs-imports t)
;;  '(haskell-process-suggest-remove-import-lines t)
;;  '(haskell-process-type (quote cabal-repl))
;;  '(haskell-process-use-presentation-mode t)
;;  '(haskell-stylish-on-save nil)
;;  '(haskell-tags-on-save nil)
;;  '(hindent-style "chris-done")
;;  '(safe-local-variable-values (quote ((haskell-indent-spaces . 4) (haskell-indent-spaces . 2) (hindent-style . "chris-done") (hindent-style . "gibiansky") (hindent-style . "johan-tibell") (haskell-process-type . cabal-repl) (shm-lambda-indent-style . leftmost-parent))))
;;  '(shm-auto-insert-bangs t)
;;  '(shm-auto-insert-skeletons t)
;;  '(shm-use-presentation-mode t))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(shm-current-face ((t (:background "LemonChiffon4"))))
;;  '(shm-quarantine-face ((t (:inherit font-lock-error)))))

;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

(setq org-latex-pdf-process '("latexmk -pdf -bibtex %f"))

(setq reftex-default-bibliography
  '("/home/yijia/Workspace/fpa-heterogeneous/reduction-order/bibliography/main.bib" "/home/fwibstwia/Workspace/java/fpa-heterogeneous/reduction-order/bibliography/main.bib"))

(setq reftex-bibpath-environment-variables
  '("/home/yijia/Workspace/fpa-heterogeneous/reduction-order/bibliography/" "/home/fwibstwia/Workspace/java/fpa-heterogeneous/reduction-order/bibliography/"))

(setq reftex-default-bibliography '("/home/yijia/Workspace/fpa-heterogeneous/reduction-order/bibliography/main.bib" "/home/fwibstwia/Workspace/java/fpa-heterogeneous/reduction-order/bibliography/main.bib"))
(setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))

(setq reftex-default-bibliography
      (quote
       ("user.bib" "local.bib" "main.bib")))

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(autoload 'reftex-mode     "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex  "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex)   ; with Emacs latex mode

;; Make RefTeX faster
(setq reftex-enable-partial-scans t)
(setq reftex-save-parse-info t)
(setq reftex-use-multiple-selection-buffers t)
(setq reftex-plug-into-AUCTeX t)

;; Make RefTeX work with Org-Mode
;; use 'C-c (' instead of 'C-c [' because the latter is already
;; defined in orgmode to the add-to-agenda command.
(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name)
  (file-exists-p (buffer-file-name))
  (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c (") 'reftex-citation))

(add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; RefTeX formats for biblatex (not natbib)
(setq reftex-cite-format
      '(
        (?\C-m . "\\cite[]{%l}")
        (?t . "\\textcite{%l}")
        (?a . "\\autocite[]{%l}")
        (?p . "\\parencite{%l}")
        (?f . "\\footcite[][]{%l}")
        (?F . "\\fullcite[]{%l}")
        (?x . "[]{%l}")
        (?X . "{%l}")
        ))

(setq font-latex-match-reference-keywords
      '(("cite" "[{")
        ("cites" "[{}]")
        ("autocite" "[{")
        ("footcite" "[{")
        ("footcites" "[{")
        ("parencite" "[{")
        ("textcite" "[{")
        ("fullcite" "[{")
        ("citetitle" "[{")
        ("citetitles" "[{")
        ("headlessfullcite" "[{")))

(setq reftex-cite-prompt-optional-args nil)
(setq reftex-cite-cleanup-optional-args t)
