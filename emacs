(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
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
 '(show-trailing-whitespace t)
 '(tool-bar-mode nil)
 '(tool-bar-style (quote image)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))
;(setq auto-mode-alist (cons '("\\.v$" . coq-mode) auto-mode-alist))
;(autoload 'coq-mode "coq" "Major mode for editing Coq vernacular." t)
(load "~/.emacs.d/ProofGeneral/generic/proof-site.elc")
(add-hook 'proof-mode-hook
  (lambda () (local-set-key '(meta tab) 'tag-complete-symbol)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'after-init-hook (lambda () (require 'ox-reveal)))
(setq org-reveal-root "file:///homes/tw1509/reveal.js")
(setq org-latex-create-formula-image-program 'dvipng)
