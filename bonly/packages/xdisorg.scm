(define-module (bonly packages xdisorg)
  #:use-module (bonly packages cpp)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix licenses) 
  #:use-module (gnu packages)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages image)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (gnu packages xdisorg)
)


(define-public pixman-0.43
  (package
    ;(inherit pixman)
    (name "pixman-0.43")
    (version "0.43.0")
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://www.cairographics.org/releases/pixman-"
         version ".tar.gz"))
       (sha256
        (base32 "02jnln2jg0m1g0835n2g1rf433haz609r00dwnz1dysqk0h2hp56"))
       ;(patches
       ; (search-patches
       ;  "pixman-CVE-2016-5296.patch")
       ;)
       ))
    (build-system meson-build-system)
    ;(arguments
    ; (list #:configure-flags
    ;       #~(list 
    ;    "--disable-static"
    ;    "--enable-timers"
    ;    "--enable-gnuplot")))
    (native-inputs
     (list pkg-config))
    (inputs
     (list libpng ))
    (synopsis "bonly's build library")
    (description "bonly's pixman lib.")
    (home-page "http://www.pixman.org/")
    (license (list license:expat license:zlib))))

(define-public pixman-cur
  (package/inherit pixman-0.43
    (name "pixman-cur")
    (version "0.43.0")
  )
)

(define-public aquamarine-0.9
  (package/inherit aquamarine
    (name "aquamarine")
    (version "0.9.1")
    (source (origin
       (method git-fetch)
       (uri (git-reference
          (url "https://github.com/hyprwm/aquamarine")
          (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1c6gyj761c5nl8hck6yqdx80v42684k0gb14xwhp36mz6pilgg6m"))
    ))
    (inputs 
       (modify-inputs (package-inputs aquamarine)
                      (replace "hyprutils" hyprutils-0.8)
     ))
))
