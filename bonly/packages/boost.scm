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
          (base32 "46d9d2c06637b219270877c9e16155cbd015b6dc84349af064c088e9b5b12f7b")
        )
      )
    )
  )
)
