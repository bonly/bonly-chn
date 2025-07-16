(define-module (bonly packages gl)
  #:use-module (gnu packages gl)
  #:use-module (guix packages)
)

(define-public mesa-25.1.5-bad
  (package/inherit mesa
    (name "mesa")
    (version "25.1.5")

  )
)
