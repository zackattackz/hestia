;; Generate a bootable image (e.g. for USB sticks, etc.) with:
;; $ guix system disk-image nongnu/system/install.scm

(define-module (install)
  #:use-module (gnu system)
  #:use-module (gnu system install)
  #:use-module (gnu packages version-control)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages mtools)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages package-management)
  #:use-module (nongnu packages linux)
  #:export (installation-os-nonfree))

(define installation-os-nonfree
  (operating-system
    (inherit installation-os)
    (kernel linux)
    (firmware (list linux-firmware))

    ;; Add the 'net.ifnames' argument to prevent network interfaces
    ;; from having really long names.  This can cause an issue with
    ;; wpa_supplicant when you try to connect to a wifi network.
    (kernel-arguments '("quiet" "modprobe.blacklist=radeon" "net.ifnames=0"))

    ;; Add some extra packages useful for the installation process
    (packages
     (append (list exfat-utils fuse-exfat git curl stow vim emacs-no-x-toolkit)
	     (operating-system-packages installation-os)))))

installation-os-nonfree
