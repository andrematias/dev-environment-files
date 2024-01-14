;;; $DOOMDIR/dap.el -*- lexical-binding: t; -*-

(defun dap-keybindings ()
        (interactive)
  ;;; Keybindings
  (map! :leader
        (:prefix ("d" . "debug")
         :desc "Start new session"        :n "d" #'dap-debug
         :desc "Next"                     :n "n" #'dap-next
         :desc "Next"                     :n "c" #'dap-continue
         :desc "Step in"                  :n "i" #'dap-step-in
         :desc "Step out"                 :n "o" #'dap-step-out
         :desc "Disconnect debug session" :n "q" #'dap-disconnect
         (:prefix ("b" . "breakpoint")
          :desc "Kill all breakpoints"           :n "k" #'dap-breakpoint-delete-all
          :desc "Toogle breakpoint at point"     :n "b" #'dap-breakpoint-toggle
          :desc "Toogle breakpoint by condition" :n "c" #'dap-breakpoint-condition
          :desc "Toogle breakpoint log message"  :n "m" #'dap-breakpoint-log-message)
         (:prefix ("u" . "dap-ui")
          :desc "Open repl window"           :n "r" #'dap-ui-repl
          :desc "Open locals window"         :n "l" #'dap-ui-locals
          :desc "Open sessions window"       :n "s" #'dap-ui-sessions)
         (:prefix ("s" . "session")
          :desc "Start last session"    :n "l" #'dap-debug-last
          :desc "Select recent session" :n "r" #'dap-debug-recent
          :desc "Restart session"       :n "a" #'dap-debug-restart))))

;;; dap for c++
(defun dap-for-cc ()
  (require 'dap-lldb)
  (setq dap-lldb-debug-program '("/usr/bin/lldb-vscode"))
  (setq dap-lldb-debugged-program-function (lambda () (read-file-name "Select file to debug.")))
  (dap-register-debug-template
   "C++ LLDB dap"
   (list :type "lldb-vscode"
         :cwd nil
         :args nil
         :request "launch"
         :program nil))

  (defun dap-debug-create-or-edit-json-template ()
    "Edit the C++ debugging configuration or create + edit if none exists yet."
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

(use-package dap-mode
  :defer
  :custom
  (dap-auto-configure-mode t)
  ;; (dap-auto-configure-features '(sessions locals breakpoints expressions tooltip repl controls))
  (dap-auto-configure-features '(repl locals))
  :config
  (dap-keybindings)
  (dap-for-python)
  (dap-for-cc))
