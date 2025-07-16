(define-module (bonly packages cpp)
  #:use-module (gnu packages cpp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
)

(define-public hyprutils-0.8
  (package/inherit hyprutils
     (name "hyprutils-0.8")
     (version "0.8.1")
     (source (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/hyprwm/hyprutils")
          (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "15iwcgm6v7y4cm8l9yh3aig31va5xifswm47bind90mac7srar0p")
        )
      ))
  )
)
