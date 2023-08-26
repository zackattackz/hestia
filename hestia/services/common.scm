(define-module (hestia services common)
  #:use-module (gnu home)
  #:use-module (gnu packages)
  #:use-module (guix gexp)
  #:use-module (gnu services)
  #:use-module (gnu home services)
  #:use-module (gnu home services shells))

(define-public common-home-services
  (list (service home-bash-service-type
	     (home-bash-configuration
	      (aliases
	       '(("gc" . "git commit")))
	      (bashrc
	       (list
		(local-file "../files/bash/.bashrc"
                            "bashrc")))
	      (bash-profile
	       (list
		(local-file
                 "../files/bash/.bash_profile"
                 "bash_profile")))))))
