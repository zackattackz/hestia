(require 'map) ;; Needed for map-merge

(setq zmacs/system-settings
  (map-merge
    'list
    '((desktop/dpi . 180)
      (emacs/default-face-size . 220)
      (emacs/variable-face-size . 245)
      (emacs/fixed-face-size . 200)
      (dunst/font-size . 20)
      (dunst/max-icon-size . 88))
    
    (when (equal system-name "typhon")
      '((desktop/dpi . 180)
        (emacs/default-face-size . 190)
        (emacs/variable-face-size . 200)
        (emacs/fixed-face-size . 190)
        (dunst/font-size . 20)
        (dunst/max-icon-size . 88)))
    
    ))
