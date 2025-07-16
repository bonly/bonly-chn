(define-module (bonly packages conky)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (gnu packages conky)
  #:use-module (gnu packages gperf)
)

(define-public conky-1.22.2
  (package
    (inherit conky)
    (name "conky-bad")
    (version "1.22.2")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/brndnmtthws/conky")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1i6z5lkbgqlh355vbcxivz470ij76qrj30zyy8nrjvbcdmsxzjdl")
        )
      )
    )
    (inputs
      (modify-inputs (package-inputs conky)
        (append gperf)
    ))
  )
)
