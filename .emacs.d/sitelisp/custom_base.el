(provide 'custom_base)
;;Set default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium-browser")
;;Set spell check
(setq-default ispell-program-name "aspell")
;;Hide the menu bar
;;(menu-bar-mode -1)
;;No splash screen
(setq inhibit-splash-screen t)
;;Disable toolbar
(tool-bar-mode -1)
;;Disable scrollbar
(scroll-bar-mode -1)

;;magit
;;(eval-after-load "magit"
;;  '(mapc (apply-partially 'add-to-list 'magit-repo-dirs)
;;               '("~/Freiheit als Autonomie/org" "~/.env" "~/Workspace"  "~/Knowledge_graph")))
(global-set-key (kbd "<f10>") 'magit-status)

(setq TeX-auto-save t)
(setq TeX-parse-self t)

(mapc (lambda (mode)
      (add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode
            'LaTeX-math-mode
            'turn-on-reftex
            'linum-mode))
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-auto-untabify t     ; remove all tabs before saving
                  TeX-show-compilation t) ; display compilation windows
            (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))


(add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
(setq auto-mode-alist
      (append '(("\\.ml[ily]?$" . tuareg-mode)
                ("\\.topml$" . tuareg-mode))
              auto-mode-alist))
(autoload 'utop-setup-ocaml-buffer "utop" "Toplevel for OCaml" t)
(add-hook 'tuareg-mode-hook 'utop-setup-ocaml-buffer)
(add-hook 'tuareg-mode-hook 'merlin-mode)
(setq merlin-use-auto-complete-mode t)
(setq merlin-error-after-save nil)
