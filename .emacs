;; Load my configuration file
(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(load-file "~/.emacs.d/sitelisp/ProofGeneral-4.2/generic/proof-site.el")
(require 'custom_base)
(require 'custom_org)

;; Customize Color theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-subtle-hacker)

;; Open crypt tool
(require 'epa-file)
(epa-file-enable)

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
