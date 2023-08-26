(defun zmacs/load-system-settings ()
  (interactive)
  (load-file "~/.emacs.d/per-system-settings.el"))

(defun zmacs/system-settings-get (setting)
  (alist-get setting zmacs/system-settings))

(provide 'zmacs-settings)
