(custom-set-variables)
(custom-set-faces
 '(default ((t (:family "IosevkaTerm Nerd Font" :foundry "UKWN" :slant normal :weight regular :height 150 :width normal)))))

(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-splash-screen t) 
(scroll-bar-mode -1)

(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

(require 'package) ;; Emacs builtin

;; set package.el repositories
(setq package-archives
'(
   ("org" . "https://orgmode.org/elpa/")
   ("gnu" . "https://elpa.gnu.org/packages/")
   ("melpa" . "https://melpa.org/packages/")
))

;; initialize built-in package management
(package-initialize)

;; update packages list if we are on a new install
(unless package-archive-contents
  (package-refresh-contents))

;; a list of pkgs to programmatically install
;; ensure installed via package.el
(setq my-package-list '(
                        use-package
                        sudo-edit
                        which-key
                        catppuccin-theme
                        python-mode
                        company-c-headers))

;; programmatically install/ensure installed
;; pkgs in your personal list
(dolist (package my-package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Evil mode (Because we are VIM users :))
(use-package evil
     :init
     (setq evil-want-integration t)
     (setq evil-want-keybinding nil)
     (setq evil-vsplit-window-right t)
     (setq evil-split-window-below t)
     (evil-mode))

(use-package which-key
    :init
    (which-key-mode 1)
    :config
    (setq which-key-side-window-location 'bottom))

(use-package catppuccin-theme
    :init
    (load-theme 'catppuccin :no-confirm)
    :config
    ;;(setq catppuccin-flavor 'latte)
    (catppuccin-reload))

(use-package sudo-edit)

;; Python Language
  (use-package python-mode)

;; C language
;; company-c-headers
(use-package company-c-headers)

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)

;; Available C style:
(setq c-default-style "linux") ;; set style to "linux"

;; Indent
(setq c-basic-offset 4)

(require 'cc-mode)

(use-package toc-org
:commands toc-org-enable
:init (add-hook 'org-mode-hool 'toc-org-enable))

(electric-indent-mode -1)

(require 'org-tempo)

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package general
:config
(general-evil-setup)

;; set up 'SPC' as the global leader key
(general-create-definer leader-keys
:states '(normal insert visual emacs)
:keymaps 'override
:prefix "SPC"
:global-prefix "M-SPC")

(leader-keys
    "." '(find-file :wk "Find file")
    "f c" '((lambda ()(interactive) (find-file "~/.config/emacs/config.org")) :wk "Edit emacs config")
    "c c" '(comment-line :wk "Comment lines")
)

(leader-keys
    "b" '(:ignore t :wk "buffer")
    "b b" '(switch-to-buffer :wk "Switch buffer")
    "b k" '(kill-this-buffer :wk "Kill this buffer")
    "b n" '(next-buffer :wk "Next buffer")
    "b p" '(previous-buffer :wk "Previous buffer")
    "b r" '(revert-buffer :wk "Reload buffer"))

(leader-keys
   "e" '(:ignore t :wk "Evaluate")
   "e b" '(eval-buffer :wk "Evaluate elisp in buffer")
   "e d" '(eval-defun :wk "Evaluate defun containing or after point")
   "e e" '(eval-expression :wk "Evaluate and elisp expression")
   "e l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
   "e r" '(eval-region :wk "Evaluate elisp in region"))

  (leader-keys
  "s f" '(sudo-edit-find-file :wk "Sudo find file")
  "s e" '(sudo-edit :wk "Sudo edit file"))
)
