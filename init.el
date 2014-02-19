(require 'package)
(package-initialize)

(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))

(defvar my-packages 
  '(starter-kit 
     evil
     geiser
     paredit
     quack
     starter-kit-lisp 
     starter-kit-bindings 
     clojure-mode 
     nrepl
     auto-complete
     ac-nrepl
     org
     rainbow-delimiters)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
    (when (not (package-installed-p p))
          (package-install p)))

(when (not package-archive-contents)
    (package-refresh-contents))

(require 'evil)
(evil-mode 1)

; @see https://github.com/bbatsov/solarized-emacs/issues/18
(require 'solarized-dark-theme)
(setq solarized-termcolor 16)
(setq solarized-use-terminal-theme t)

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code.")
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
