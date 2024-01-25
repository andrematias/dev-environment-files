;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; General configurations
(setq doom-theme 'modus-operandi)
(setq display-line-numbers-type t)
(setq org-directory "~/org/")
(setq lisp-body-indent 2)
(setq doom-font (font-spec :family "IosevkaTerm Nerd Font Mono" :size 15))

;;; Doom Modeline
(after! doom-modeline
  (minions-mode 1)
  (setq doom-modeline-minor-modes t)
  (setq doom-modeline-modal t)
  (setq doom-modeline-modal-modern-icon nil)
  (setq doom-modeline-icon t)
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-buffer-state-icon t)
  (setq doom-modeline-buffer-modification-icon t)
  (setq doom-modeline-height 10)
  (setq nerd-icons-scale-factor 0.8)
  ;; (setq doom-modeline-height 1)
  ;; (custom-set-faces
  ;;  '(mode-line ((t (:family "IosevkaTerm Nerd Font" :height 150))))
  ;;  '(mode-line-active ((t (:family "IosevkaTerm Nerd Font" :height 150)))) ; For 29+
  ;;  '(mode-line-inactive ((t (:family "IosevkaTerm Nerd Font" :height 150)))))
  (setq doom-modeline-buffer-encoding 'nondefault)
  (setq doom-modeline-hud 'nondefault))

;;; DAP configurations
(after! dap-mode (load! "./dap.el"))

;;; Treemacs Keybindings
(map! :leader
(:prefix ("f" . "File Explorer Treemacs")
        :desc "Toggle treemacs"        :n "e" #'treemacs))
