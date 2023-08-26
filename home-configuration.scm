(use-modules
 (gnu home)
 (gnu packages)
 (gnu services)
 (guix gexp)
 (gnu home services)
 (gnu home services shells))

(home-environment
 ;; Below is the list of packages that will show up in your
 ;; Home profile, under ~/.guix-home/profile.
 (packages
  (specifications->packages
   (list "emacs-guix"
         "git"
         "bibata-cursor-theme"
         "firefox"
	 "flatpak"
	 "xdg-desktop-portal"
	 "nvidia-settings"
	 "element-desktop"
	 "alsa-utils"
	 "pavucontrol")))
 ;; Below is the list of Home services.  To search for available
 ;; services, run 'guix home search KEYWORD' in a terminal.
 (services
  (list
   (service home-bash-service-type
	    (home-bash-configuration
	     (aliases
	      '(("gc" . "git commit")))
	     (bashrc
	      (list
	       (local-file ".bashrc"
                           "bashrc")))
	     (bash-profile
	      (list
	       (local-file
                ".bash_profile"
                "bash_profile")))))
   (simple-service 'emacs-config
		   home-files-service-type
		   `((".emacs.d/init.el" ,(local-file "./.emacs.d/init.el")))))))
