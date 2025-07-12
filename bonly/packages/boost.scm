(define-module (bonly packages boost)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (gnu packages boost)
)

(define (version-with-underscores version)
  (string-map (lambda (x) (if (eq? x #\.) #\_ x)) version))

(define-public boost-1.88
  (package
    (inherit boost)
    (version "1.88.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://archives.boost.io/release/" 
                            version "/source/boost_"
                            (version-with-underscores version) ".tar.bz2"))
        (sha256
          (base32 "1w482jl80s2bajn3bkf20mwi2p1n1jh290j55vrsf0m3345dkkip")
        )
      )
    )
  )
)
