(define-module (bonly packages gl)
  #:use-module (gnu packages gl)
  #:use-module (guix packages)
)

(define-public mesa-25.1.5
  (package/inherit mesa
    (name "mesa-bad")
    (version "25.1.5")

  )
)
