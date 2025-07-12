(define-module (bonly packages calcurse)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (gnu packages calcurse)
)

(define-public calcurse-4.8
  (package
    (inherit calcurse)
    (name "calcurse")
    (version "4.8.1")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://calcurse.org/files/calcurse-" version ".tar.gz"))
        (sha256
          (base32  "02l3spj2ai97b87winz3kvsxvf66g74lm46b7kcbhsgx2iqb6syq")
        )
      )
    )
  )
)

