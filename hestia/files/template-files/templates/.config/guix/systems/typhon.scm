(define-module (typhon)
  #:use-module (base-system)
  #:use-module (base-system nvidia)
  #:use-module (gnu)
  #:use-module (nongnu packages linux))

(inject-nvidia
 (operating-system
  (inherit base-operating-system)
  (host-name "typhon")
  (mapped-devices (list (mapped-device
			 (source (uuid
				  "37f66e4b-4a82-4340-ae90-76588f3606f5"))
			 (target "cryptroot")
			 (type luks-device-mapping))))

  (file-systems (cons* (file-system
			(mount-point "/boot/efi")
			(device (uuid "450D-4F3B"
				      'fat32))
			(type "vfat"))
		       (file-system
			(mount-point "/")
			(device "/dev/mapper/cryptroot")
			(type "ext4")
			(dependencies mapped-devices))
		       (file-system
			(mount-point "/mnt/disk00")
			(device
			 (uuid "9e127c97-98f8-4aab-b086-4672488084e9"))
			(type "ext4"))
		       %base-file-systems))))
