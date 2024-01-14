;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; General configurations
(setq doom-theme 'modus-operandi)
(setq display-line-numbers-type t)
(setq org-directory "~/org/")
(setq lisp-body-indent 2)
(setq doom-font (font-spec :family "IosevkaTerm Nerd Font Mono" :size 15))

;;; Doom Modeline
(after! doom-modeline
  (setq doom-modeline-height 10)
  (setq doom-modeline-icon 'nil)
  (setq doom-modeline-buffer-encoding 'nondefault)
  (setq doom-modeline-hud 'nondefault))

;;; DAP configurations
(after! dap-mode (load! "./dap.el"))
