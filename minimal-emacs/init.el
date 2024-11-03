;; Global settings
(setq user-full-name "Andre Matias"
      user-mail-address "dev.andrematias@gmail.com")
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 20)
(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font Mono" :height 160)
(column-number-mode)
(global-display-line-numbers-mode t)
(setq gc-cons-threshold (* 50 1000 1000))

;; Disable line number for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

; Package managers
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require  'use-package)
(setq use-package-always-ensure t)

;; Evil mode
(use-package evil
  :demand t
  :diminish evil-mode
  :bind (("<escape>" . keyboard-escape-quit))
  :custom
    (evil-want-keybinding nil)
    (evil-normal-state-cursor '("gray" box))
    (evil-visual-state-cursor '("orange" box))
    (evil-insert-state-cursor '("dodger blue" bar))
    (evil-replace-state-cursor '("red" bar))
    (evil-disable-insert-state-bindings t)
  :config
    (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
    (setq evil-want-integration t)
    (evil-collection-init))

;; Ivy
(use-package ivy
  :demand
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	    ("TAB" . ivy-alt-done)
	    ("C-l" . ivy-alt-done)
	    ("C-j" . ivy-next-line)
	    ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	    ("C-k" .  ivy-previous-line)
	    ("C-l" .  ivy-done)
	    ("C-d" .  ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	    ("C-k" .  ivy-previous-line)
	    ("C-d" .  ivy-reverse-i-search-kill))
  :config
    (ivy-mode 1))

;; Doom modeline
(use-package doom-modeline
  :ensure t
  :custom
    (doom-modeline-modal nil)
    (doom-modeline-modal-icon nil)
  :init (doom-modeline-mode 1))

;; Gruvbox theme
(use-package gruvbox-theme
  :config
    (load-theme 'gruvbox-dark-hard t))

;; Wich key
(use-package which-key
  :init (which-key-mode)
  :diminish
  :config
  (setq which-ley-idle-delay 0.3))

;; Project setup
(use-package magit)

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :bind
;;    (("SPC p f" . helm-projectile-find-file)
;;    ("SPC p p" . helm-projectile-switch-project)
;;    ("SPC p s" . projectile-save-project-buffers))
  :config
    (projectile-mode +1)
)
