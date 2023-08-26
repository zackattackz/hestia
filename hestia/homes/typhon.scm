(define-module (hestia homes typhon)
  #:use-module (gnu home)
  #:use-module (gnu services)
  #:use-module (gnu services databases)
  #:use-module (gnu packages databases)
  #:use-module (hestia services common))

(home-environment
 (services common-home-services))
