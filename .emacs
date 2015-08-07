;; Load my configuration file
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(load-file "~/.emacs.d/sitelisp/ProofGeneral-4.2/generic/proof-site.el")
(require 'custom_base)
(require 'custom_org)

;; Customize Color theme
;;(require 'color-theme)
;;(color-theme-initialize)
;;(color-theme-subtle-hacker)

(setq magit-last-seen-setup-instructions "1.4.0")

;; Open crypt tool
(require 'epa-file)
(epa-file-enable)

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(load-file "~/.emacs.d/sitelisp/emacs-haskell-config/init.el")
(package-initialize)
(load-theme 'zenburn t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-complete-module-preferred (quote ("Data.ByteString" "Data.ByteString.Lazy" "Data.Conduit" "Data.Function" "Data.List" "Data.Map" "Data.Maybe" "Data.Monoid" "Data.Ord")))
 '(haskell-interactive-mode-eval-mode (quote haskell-mode))
 '(haskell-interactive-mode-eval-pretty nil)
 '(haskell-interactive-mode-include-file-name nil)
 '(haskell-notify-p t)
 '(haskell-process-args-cabal-repl (quote ("--ghc-option=-ferror-spans" "--with-ghc=ghci-ng")))
 '(haskell-process-args-ghci (quote ("-ferror-spans")))
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-generate-tags nil)
 '(haskell-process-log t)
 '(haskell-process-path-ghci "ghci-ng")
 '(haskell-process-reload-with-fbytecode nil)
 '(haskell-process-suggest-haskell-docs-imports t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-process-use-presentation-mode t)
 '(haskell-stylish-on-save nil)
 '(haskell-tags-on-save nil)
 '(hindent-style "chris-done")
 '(safe-local-variable-values (quote ((haskell-indent-spaces . 4) (haskell-indent-spaces . 2) (hindent-style . "chris-done") (hindent-style . "gibiansky") (hindent-style . "johan-tibell") (haskell-process-type . cabal-repl) (shm-lambda-indent-style . leftmost-parent))))
 '(shm-auto-insert-bangs t)
 '(shm-auto-insert-skeletons t)
 '(shm-use-presentation-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(shm-current-face ((t (:background "LemonChiffon4"))))
 '(shm-quarantine-face ((t (:inherit font-lock-error)))))

(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
