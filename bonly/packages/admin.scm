(define-module (bonly packages admin)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (gnu packages admin)
)

(define-public libpcap-1.10.5
  (package
    (inherit libpcap)
    (version "1.10.5")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://www.tcpdump.org/release/libpcap-" version ".tar.gz"))
        (sha256
          (base32 "1w482jl80s2bajn3bkf20mwi2p1n1jh290j55vrsf0m3345dkkip")
        )
      )
    )
  )
)
