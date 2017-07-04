(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(agda2-include-dirs (quote ("." "/home/thomas/oplss/agda-prelude/src")))
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(coq-auto-insert-as t)
 '(coq-compile-before-require t)
 '(coq-compile-parallel-in-background t)
 '(coq-confirm-external-compilation nil)
 '(coq-one-command-per-line nil)
 '(custom-enabled-themes (quote (deeper-blue)))
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

;(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'after-init-hook (lambda () (require 'ox-reveal)))
(setq org-reveal-root "file:///homes/tw1509/reveal.js")
(setq org-latex-create-formula-image-program 'dvipng)
(setq emerge-diff-options "--ignore-all-space")

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line
