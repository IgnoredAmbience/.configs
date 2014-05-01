(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coq-auto-insert-as t)
 '(coq-compile-before-require t)
 '(coq-compile-parallel-in-background t)
 '(coq-confirm-external-compilation nil)
 '(coq-one-command-per-line nil)
 '(custom-enabled-themes (quote (deeper-blue)))
 '(font-use-system-font t)
 '(proof-electric-terminator-enable t)
 '(proof-script-fly-past-comments t)
 '(proof-splash-enable nil)
 '(proof-sticky-errors t)
 '(proof-three-window-enable t)
 '(proof-three-window-mode-policy (quote hybrid))
 '(show-trailing-whitespace t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;(setq auto-mode-alist (cons '("\\.v$" . coq-mode) auto-mode-alist))
;(autoload 'coq-mode "coq" "Major mode for editing Coq vernacular." t)
(load "~/.emacs.d/ProofGeneral/generic/proof-site.elc")
(add-hook 'proof-mode-hook
  (lambda () (local-set-key '(meta tab) 'tag-complete-symbol)))
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(load "~/.emacs.d/cdlatex.el")
