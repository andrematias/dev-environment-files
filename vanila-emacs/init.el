;; NOTE: init.el is now generated from Emacs.org.  Please edit that file
;;       in Emacs and init.el will be generated automatically!

;; You will most likely need to adjust this font size for your system!
(defvar efs/default-font-size 160)
(defvar efs/default-variable-font-size 160)

;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			("org" . "https://orgmode.org/elpa/")
			("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
    (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
    (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(setq confirm-kill-emacs 'y-or-n-p)
;;(setq split-width-threshold nil)
(setq inhibit-startup-message t)
;; Remove messages from the *Messages* buffer.
(setq-default message-log-max nil)

(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*"))) 

(set-window-margins (selected-window) 1 1)
(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)          ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

(column-number-mode)
(global-display-line-numbers-mode t)
;;(setq display-line-numbers-type 'relative)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		vterm-mode-hook
		term-mode-hook
		shell-mode-hook
		treemacs-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;;; Window auto focus
(setq split-window-preferred-function 'my/split-window-func)
(defun my/split-window-func (&optional window)
  (let ((new-window (split-window-sensibly window)))
    (if (not (active-minibuffer-window))
	(select-window new-window))))

(set-face-attribute 'default nil :font "IosevkaTerm Nerd Font" :height efs/default-font-size)

;; Set the fixed pitch face
(set-face-attribute 'fixed-pitch nil :font "IosevkaTerm Nerd Font" :height efs/default-font-size)

;; Set the variable pitch face
(set-face-attribute 'variable-pitch nil :font "Cantarell" :height efs/default-variable-font-size :weight 'regular)

(use-package ligature
  :config
  (ligature-set-ligatures 'prog-mode '("<---" "<--"  "<<-" "<-" "->" "-->" "--->" "<->" "<-->" "<--->" "<---->" "<!--"
				       "<==" "<===" "<=" "=>" "=>>" "==>" "===>" ">=" "<=>" "<==>" "<===>" "<====>" "<!---"
				       "<~~" "<~" "~>" "~~>" "::" ":::" "==" "!=" "===" "!=="
				       ":=" ":-" ":+" "<*" "<*>" "*>" "<|" "<|>" "|>" "+:" "-:" "=:" "<******>" "++" "+++"))
  (global-ligature-mode t))

(require 'windmove)

;;;###autoload
(defun buf-move-up ()
    "Swap the current buffer and the buffer above the split.
If there is no split, ie now window above the current one, an
error is signaled."
;;  "Switches between the current buffer, and the buffer above the
;;  split, if possible."
    (interactive)
    (let* ((other-win (windmove-find-other-window 'up))
	(buf-this-buf (window-buffer (selected-window))))
    (if (null other-win)
	(error "No window above this one")
	;; swap top with this one
	(set-window-buffer (selected-window) (window-buffer other-win))
	;; move this one to top
	(set-window-buffer other-win buf-this-buf)
	(select-window other-win))))

;;;###autoload
(defun buf-move-down ()
"Swap the current buffer and the buffer under the split.
If there is no split, ie now window under the current one, an
error is signaled."
    (interactive)
    (let* ((other-win (windmove-find-other-window 'down))
	(buf-this-buf (window-buffer (selected-window))))
    (if (or (null other-win) 
	    (string-match "^ \\*Minibuf" (buffer-name (window-buffer other-win))))
	(error "No window under this one")
	;; swap top with this one
	(set-window-buffer (selected-window) (window-buffer other-win))
	;; move this one to top
	(set-window-buffer other-win buf-this-buf)
	(select-window other-win))))

;;;###autoload
(defun buf-move-left ()
"Swap the current buffer and the buffer on the left of the split.
If there is no split, ie now window on the left of the current
one, an error is signaled."
    (interactive)
    (let* ((other-win (windmove-find-other-window 'left))
	(buf-this-buf (window-buffer (selected-window))))
    (if (null other-win)
	(error "No left split")
	;; swap top with this one
	(set-window-buffer (selected-window) (window-buffer other-win))
	;; move this one to top
	(set-window-buffer other-win buf-this-buf)
	(select-window other-win))))

;;;###autoload
(defun buf-move-right ()
"Swap the current buffer and the buffer on the right of the split.
If there is no split, ie now window on the right of the current
one, an error is signaled."
    (interactive)
    (let* ((other-win (windmove-find-other-window 'right))
	(buf-this-buf (window-buffer (selected-window))))
    (if (null other-win)
	(error "No right split")
	;; swap top with this one
	(set-window-buffer (selected-window) (window-buffer other-win))
	;; move this one to top
	(set-window-buffer other-win buf-this-buf)
	(select-window other-win))))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-anzu
  :ensure t
  :after evil
  )

(use-package anzu
  :ensure t
  :diminish (anzu-mode)
  :config
  (global-anzu-mode))

(use-package evil-commentary 
  :init (evil-commentary-mode) 
  :after evil)

;; general
(use-package general
:config
(general-evil-setup t)
(defconst my-leader "SPC")
(general-create-definer my-leader-def
    :prefix my-leader)
(general-override-mode)
(my-leader-def
    :states '(motion normal visual)
    :keymaps 'override 

    "u" '(universal-argument :which-key "Universal argument")
    ";" '(eval-region :which-key "eval-region")
    "C-SPC" '(projectile-find-file-other-frame :which-key "Projectile find file (new frame)")
    "S-SPC" '(projectile-find-file-other-frame :which-key "Projectile find file (new frame)")
    "." '(find-file :which-key "Find file")
    ">" '(find-file-other-frame :which-key "Find file (new frame)")
    "d" '(dired-jump :which-key "dired-jump")
    "a" '(ace-window :which-key "ace-window")
    "m" '(counsel-imenu :which-key "iMenu Symbols")

    ;; files
    "f" '(:ignore t :which-key "File Explorer")
    "fr" '(counsel-recentf :which-key "Recent files")
    "ff" '(find-file :which-key "Find file")
    "fg" '(counsel-ag :which-key "Grep text")
    "fe" '(treemacs :which-key "File Explorer")


    ;; code + lsp
    "c"   '(:ignore t :which-key "Code")
    "cs" '(counsel-imenu :which-key "iMenu Symbols")
    "cp" '(point-to-register :which-key "point-to-register")
    "cj" '(jump-to-register :which-key "jump-to-register")
    "cu" '(undo :which-key "undo")
    "cr" '(query-replace :which-key "query-replace")
    "cc"  '(compile :which-key "Compile")
    "cm"  '(makefile-executor-execute-project-target :which-key "Compile Project Makefile Target")
    "ck"  '(kill-compilation :which-key "Kill compilation")

    "cl" '(:ignore t :which-key "LSP")
    "clr" '(lsp-rename :which-key "Lsp Rename Symbol")
    "clF" '(lsp-format-buffer :which-key "Lsp Format Buffer")
    "clf" '(lsp-format-region :which-key "Lsp Format region")
    "cla" '(lsp-execute-code-action :which-key "Lsp code action")
    "cls" '(lsp-treemacs-symbols :which-key "Show symbols")
    "cle" '(lsp-treemacs-errors-list :which-key "Show errors list")
    "cli" '(lsp-treemacs-implementations :which-key "Show implementations list")
    "cld" '(lsp-treemacs-references :which-key "Show references list")

    "cf" '(:ignore t :which-key "Fold")
    "cfh" '(hs-hide-block :which-key "hs-hide-block")
    "cfs" '(hs-show-block :which-key "hs-show-block")
    "cfa" '(hs-show-all :which-key "hs-show-all")
    "nh" '(git-gutter:next-hunk :which-key "Next hunk")
    "ph" '(git-gutter:previous-hunk :which-key "Previous hunk")
    ;; "ch" '(:ignore t :which-key "Help")


    ;; editor
    "e" '(:ignore t :which-key "Editor")
    "ed" '(dashboard-open :which-key "Open dashboard")

    ;; buffer
    "b" '(:ignore t :which-key "Buffer")
    "bb" '(counsel-projectile-switch-to-buffer :which-key "Switch buffer")
    "b[" '(previous-buffer :which-key "Previous buffer")
    "b]" '(next-buffer :which-key "Next buffer")
    "bc" '(kill-current-buffer :which-key "Close buffer")
    "bC" '(kill-other-buffers :which-key "Close other buffers")
    "bl" '(evil-switch-to-windows-last-buffer :which-key "Switch to last buffer")
    "br" '(revert-buffer-no-confirm :which-key "Revert buffer")

    "s" '(:ignore t :wk "Split")
    "ss" '(evil-window-split :wk "Horizontal split window")
    "sv" '(evil-window-vsplit :wk "Vertical split window")

    "w" '(:ignore t :wk "Windows")
    "wk" '(evil-window-delete :wk "Close window")
    "wc" '(evil-window-delete :wk "Close window")
    "wn" '(evil-window-new :wk "New window")
    "ws" '(evil-window-split :wk "Horizontal split window")
    "wv" '(evil-window-vsplit :wk "Vertical split window")
    "wh" '(evil-window-left :wk "Window left")
    "wj" '(evil-window-down :wk "Window down")
    "wk" '(evil-window-up :wk "Window up")
    "wl" '(evil-window-right :wk "Window right")
    "ww" '(evil-window-next :wk "Goto next window")
    "wH" '(buf-move-left :wk "Buffer move left")
    "wJ" '(buf-move-down :wk "Buffer move down")
    "wK" '(buf-move-up :wk "Buffer move up")
    "wL" '(buf-move-right :wk "Buffer move right")

    ;; open
    "o" '(:ignore t :which-key "Open")
    "oc" '(open-init-file :which-key "Open Emacs.org")
    "ot" '(vterm-toggle :which-key "vterm-toggle")
    "oT" '(vterm :which-key "Open vterm current buffer")

    ;; project
    "p" '(:ignore t :which-key "Project")
    "pp" '(projectile-switch-project :which-key "Switch Project")
    "po" '(projectile-find-other-file :which-key "projectile-find-other-file")
    "pf" '(projectile-find-file :which-key "Projectile find file")

    ;; help
    "h" '(:ignore t :which-key "Help")
    "hf" '(helpful-callable :which-key "describe-function")
    "hk" '(helpful-key :which-key "describe-key")
    "hv" '(helpful-variable :which-key "describe-variable")
    "hp" '(helpful-at-point :which-key "describe-at-point")
    "ho" '(helpful-symbol :which-key "describe-symbol")
    "hm" '(describe-mode :which-key "describe-mode")
    "hF" '(describe-face :which-key "describe-face")
    "hw" '(where-is :which-key "where-is")
    "h." '(display-local-help :which-key "display-local-help")
    "hc" '(:ignore t :which-key "Code")
    "hcp" '(lsp-describe-thing-at-point :which-key "Lsp describe thind at point")
    "hcd" '(lsp-ui-doc-toggle :which-key "Toggle documentation at point")

    ;; zoom
    ;; the hydra is nice but the rest is kind of janky, need to play around with this more
    "=" '(text-scale-increase :which-key "text-scale-increase")
    "-" '(text-scale-decrease :which-key "text-scale-decrease")

    ;; window
    "w" '(:ignore t :which-key "Window")
    "ww" '(ace-window :which-key "ace-window")

    ;; toggles
    "t" '(:ignore t :which-key "Toggles")
    "tw" '(visual-line-mode :which-key "visual-line-mode")
    "tt" '(load-theme :which-key "load theme")
    "td" '(:ignore t :which-key "Todos")
    "tdn" '(hl-todo-next :which-key "Go to next TODO")
    "tdp" '(hl-todo-previous :which-key "Go to previous TODO")
    "tdi" '(hl-todo-insert :which-key "Insert TODO")
    "tdg" '(hl-todo-rgrep :which-key "Show all TODOS")

    ;; narrow
    "N" '(:ignore t :which-key "Narrow")
    "Nr" '(narrow-to-region :which-key "narrow-to-region")
    "Nw" '(widen :which-key "widen")

    ;; git
    "g" '(:ignore t :which-key "Git") ; prefix
    "gg" '(magit-status :which-key "Git status")))


;; evil bindings
;; normal/visual mode hotkeys
(general-define-key
    :states '(normal visual)
    ;; evil numbers
    "g=" 'evil-numbers/inc-at-pt
    "g-" 'evil-numbers/dec-at-pt

    ;; go to references
    "gr" 'xref-find-references
    "gD" 'xref-find-references

    ;; movement
    "C-n" 'evil-next-visual-line 
    "C-p" 'evil-previous-visual-line
    "C-h" 'evil-window-left
    "C-j" 'evil-window-down
    "C-k" 'evil-window-up
    "C-l" 'evil-window-right)

(use-package all-the-icons)
(use-package nerd-icons)

(use-package mood-line
  :init (mood-line-mode 1))

(use-package vterm-toggle
:after vterm
:config
(setq vterm-toggle-fullscreen-p nil)
(setq vterm-toggle-scope 'project)
(add-to-list 'display-buffer-alist
	    '((lambda (buffer-or-name _)
		    (let ((buffer (get-buffer buffer-or-name)))
		    (with-current-buffer buffer
			(or (equal major-mode 'vterm-mode)
			    (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
		(display-buffer-reuse-window display-buffer-at-bottom)
		;;(display-buffer-reuse-window display-buffer-in-direction)
		;;display-buffer-in-direction/direction/dedicated is added in emacs27
		;;(direction . bottom)
		;;(dedicated . t) ;dedicated is supported in emacs27
		(reusable-frames . visible)
		(window-height . 0.3))))

(use-package hydra)

(use-package treemacs-nerd-icons
  :after (treemacs)
  :config
  (treemacs-load-theme "nerd-icons"))

(use-package treemacs
  :config
  (treemacs-project-follow-mode t)
  ;; To disable modeline uncomment bellow
  (setq treemacs-user-mode-line-format 'none)
  ;;(setq treemacs-user-header-line-format "File Explorer")
  :ensure t)

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package dashboard
    :after nerd-icons
    :ensure t
    :config
    (dashboard-setup-startup-hook)
    (blink-cursor-mode -1)
    (set-face-foreground 'highlight nil)
    :init
    (setq dashboard-startup-banner "~/.emacs.d/emacs_logo.png")
    (setq dashboard-items '((recents  . 5)
			    (projects . 5)))
    (setq dashboard-footer-messages '("André Matias"))
    (setq dashboard-icon-type 'nerd-icons)
    (setq dashboard-set-heading-icons t)
    (setq dashboard-set-file-icons t)
    (setq dashboard-center-content t))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t    
	doom-themes-enable-italic t)
  (doom-themes-visual-bell-config)
  (setq doom-themes-treemacs-theme "doom-atom")
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

(load-theme 'modus-operandi t)

(use-package minions
  :config (minions-mode 1))

(use-package which-key
:init (which-key-mode)
:diminish which-key-mode
:config
(setq which-key-idle-delay 1))

(use-package ivy
  :demand t
:diminish
:bind (("C-s" . swiper)
	:map ivy-minibuffer-map
	("TAB" . ivy-alt-done)
	("C-l" . ivy-alt-done)
	("C-j" . ivy-next-line)
	("C-k" . ivy-previous-line)
	:map ivy-switch-buffer-map
	("C-k" . ivy-previous-line)
	("C-l" . ivy-done)
	("C-d" . ivy-switch-buffer-kill)
	:map ivy-reverse-i-search-map
	("C-k" . ivy-previous-line)
	("C-d" . ivy-reverse-i-search-kill))
:config
  (ivy-mode 1)
  (setq 
   ivy-height 20
   ivy-initial-inputs-alist nil
	  ivy-use-virtual-buffers t))

(use-package ivy-prescient 
  :after ivy)

(use-package ivy-rich
  :after (ivy)
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :demand t
  :config
  (counsel-mode 1))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package highlight-indent-guides
  :ensure t
  :defer t
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-character ?\|)
  (setq highlight-indent-guides-responsive 'top))

(require 'org-tempo)

(electric-indent-mode -1)
(defun efs/org-mode-setup ()
  (org-indent-mode nil)
  (variable-pitch-mode 1)
  (visual-line-mode 1))
(use-package toc-org
    :commands toc-org-enable
    :init (add-hook 'org-mode-hook 'toc-org-enable))

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(org-babel-do-load-languages
    'org-babel-load-languages
    '((emacs-lisp . t)
    (python . t)))

(push '("conf-unix" . conf-unix) org-src-lang-modes)

;; Automatically tangle our Emacs.org config file when we save it
(defun efs/org-babel-tangle-config ()
    (when (string-equal (buffer-file-name)
			(expand-file-name "~/projects/dotfiles/vanila-emacs/Emacs.org"))
    ;; Dynamic scoping to the rescue
    (let ((org-confirm-babel-evaluate nil))
	(org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'efs/org-babel-tangle-config)))

(use-package pdf-tools
  :defer t
  :commands (pdf-view-mode pdf-tools-install)
  :mode (".pP][dD][fF]\\'" . pdf-view-mode)
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install)
  (define-pdf-cache-function pagelabels)
  (setq-default pdf-view-display-size 'fit-page))

(require 'display-line-numbers)
(defun display-line-numbers--turn-on ()
  (unless (or (minibufferp) (eq major-mode 'pdf-view-mode))
    (blink-cursor-mode -1)
    (display-line-numbers-mode nil)))

(use-package yasnippet
  :ensure t
  :hook ((text-mode
	  prog-mode
	  conf-mode
	  snippet-mode) . yas-minor-mode-on)
  :init
  (setq yas-snippet-dir "~/.emacs.d/snippets"))

(use-package tree-sitter
  :demand t
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook 'tree-sitter-hl-mode))

(use-package tree-sitter-langs 
  :after tree-sitter)

(use-package makefile-executor
  :demand t
  :config
  (add-hook 'prog-mode-hook 'makefile-executor-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
    :hook ((typescript-mode . lsp)
      (c-mode . lsp)
      (hs-minor-mode . lsp))
    :init
    (setq lsp-keymap-prefix "C-c l")
    :config
    (lsp-enable-which-key-integration t)
    (setq lsp-headerline-breadcrumb-enable nil))

(use-package lsp-ui 
  :after lsp-mode
  :commands lsp-ui-mode
  :custom
  (lsp-ui-doc-position 'at-point))

  (use-package flycheck-inline
    :hook (lsp-mode . flycheck-inline-mode))

(use-package lsp-ivy :after lsp-mode)

(use-package lsp-treemacs :after lsp-mode)

(use-package helpful
  :config
  (setq counsel-describe-function-function #'helpful-callable)
  (setq counsel-describe-variable-function #'helpful-variable)
  (global-set-key (kbd "C-c C-d") #'helpful-at-point)
  (global-set-key (kbd "C-h F") #'helpful-function)
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key)
  (global-set-key (kbd "C-h x") #'helpful-command))

;;; dap for c/c++
(defun dap-for-cc ()
    (require 'dap-lldb)
    (setq dap-lldb-debug-program '("/usr/bin/lldb-vscode"))
    (setq dap-lldb-debugged-program-function (lambda () (read-file-name "Select file to debug.")))
    (dap-register-debug-template
      "C/C++ LLDB dap"
      (list :type "lldb-vscode"
	  :cwd nil
	  :args nil
	  :request "launch"
	  :program nil))

    (defun dap-debug-create-or-edit-json-template ()
	"Edit the C/C++ debugging configuration or create + edit if none exists yet."
	(interactive)
	(let ((filename (concat (lsp-workspace-root) "/launch.json"))
	    (default "~/.emacs.d/default-launch.json"))
	(unless (file-exists-p filename)
	    (copy-file default filename))
	(find-file-existing filename))))

  ;;; dap for python
  (defun dap-for-python ()
    (require 'dap-python)
    (setq dap-python-debugger 'debugpy))

  (defun dap-for-node ()
      (require 'dap-node)
      (dap-node-setup))

  (use-package dap-mode
    :custom
    (dap-auto-configure-features '(repl locals))
    :after lsp-mode
    :ensure t
    :defer t
    :config
    ;; (dap-keybindings)
    (dap-for-python)
    (dap-for-node)
    (dap-for-cc)

    ;; Bind `C-c l d` to `dap-hydra` for easy access
    (general-define-key
     :keymaps 'lsp-mode-map
     :prefix lsp-keymap-prefix
     "d" '(dap-hydra t :wk "debugger")))

(use-package company
    :after lsp-mode
    :hook
        (lsp-mode . company-mode)
    :bind (:map company-active-map
	("<tab>" . company-complete-selection))
	(:map lsp-mode-map
	("<tab>" . company-indent-or-complete-common))
    :custom
    (company-minimum-prefix-length 1)
    (company-idle-delay 0.0))

(use-package company-box
    :hook (company-mode . company-box-mode))

(use-package projectile
    :diminish projectile-mode
    :config (projectile-mode)
    :custom ((projectile-completion-system 'ivy))
    :bind-keymap
    ("C-c p" . projectile-command-map)
    :init
    ;; NOTE: Set this to the folder where you keep your Git repos!
    (when (file-directory-p "~/projects")
    (setq projectile-project-search-path '("~/projects")))
    (setq projectile-switch-project-action #'projectile-dired)
    (setq projectile-globally-ignored-files '(".DS_Store" "TAGS"))
    (setq projectile-globally-ignored-file-suffixes '(".elc" ".pyc" ".o")))

(use-package counsel-projectile
  :after projectile
  :config (counsel-projectile-mode))

(use-package hl-todo 
  :defer t
  :config (setq hl-todo-keyword-faces
		'(("TODO"   . "#FF0000")
		  ("FIXME"  . "#FF0000")
		  ("DEBUG"  . "#A020F0")
		  ("GOTCHA" . "#FF4500")
		  ("STUB"   . "#1E90FF"))))

(use-package git-gutter)
(add-hook 'prog-mode-hook 'git-gutter-mode)

(use-package magit
    :commands magit-status
    :custom
    (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;;(use-package evil-magit :after magit)

(use-package evil-nerd-commenter
  :after evil
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

(use-package emmet-mode
  :demand t
  :ensure t)

(use-package lsp-pyright
	  :ensure t
	  :after lsp-mode
	  :hook (python-mode . (lambda ()
				  (setq indent-tabs-mode t)
				  (setq tab-width 4)
				  (setq python-indent-offset 4)
				  (company-mode 1)
				  (require 'lsp-pyright)
				  (pyvenv-autoload)
				  (lsp))))
(use-package pyvenv
  :ensure t
  :after python-mode) 
(defun pyvenv-autoload ()
    (require 'pyvenv)
    (require 'projectile)
    (interactive)
    "auto activate venv directory if exists"
    (f-traverse-upwards (lambda (path)
			    (let ((venv-path (f-expand "env" path)))
			    (when (f-exists? venv-path)
				(pyvenv-activate venv-path))))))
(add-hook 'python-mode 'pyvenv-autoload)

;; Available C style:
(setq c-default-style "stroustrup") ;; set style to "linux"

;; Indent
(setq c-basic-offset 4)

(use-package vterm
    :commands vterm
    :config
    (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")  ;; Set this to match your custom shell prompt
    ;;(setq vterm-shell "zsh")                       ;; Set this to customize the shell to launch
    (setq vterm-max-scrollback 10000))

(use-package dired
    :ensure nil
    :commands (dired dired-jump)
    :bind (("C-x C-j" . dired-jump))
    :custom ((dired-listing-switches "-agho --group-directories-first"))
    :config
    (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer))

(use-package dired-single :after dired)

(use-package dired-open
  :after dired
  :config
  ;; Doesn't work as expected!
  ;;(add-to-list 'dired-open-functions #'dired-open-xdg t)
  (setq dired-open-extensions '(("png" . "feh")
				("mkv" . "mpv"))))

(use-package dired-hide-dotfiles
  :after dired
  :hook (dired-mode . dired-hide-dotfiles-mode)
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "H" 'dired-hide-dotfiles-mode))
