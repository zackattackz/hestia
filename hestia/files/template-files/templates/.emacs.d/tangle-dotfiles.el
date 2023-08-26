(require 'org)
(load-file "./.emacs.d/lisp/zmacs-settings.el")

;; Don't ask when evaluating code blocks
(setq org-confirm-babel-evaluate nil)

(let* ((org-files (directory-files "./" nil "\\.org$")))
  (defun zmacs/tangle-org-file (org-file)
    (message "\n\033[1;32mUpdating %s\033[0m\n" org-file)
    (org-babel-tangle-file (expand-file-name org-file "./")))

  ;; Tangle Systems.org first
  (zmacs/tangle-org-file "Systems.org")

  (dolist (org-file org-files)
    (unless (member org-file '("README.org" "Systems.org"))
      (zmacs/tangle-org-file org-file))))
