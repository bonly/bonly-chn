(define-module (bonly packages vim)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix licenses) 
  #:use-module (gnu packages)
  #:use-module (gnu packages gawk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages ghostscript)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages image)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages textutils)
)

(define-public neovim-0.11
  (package
    (inherit neovim)
    (name "neovim-bad")
    (version "0.11.3")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://github.com/neovim/neovim")
               (commit (string-append "v" version))))
        (file-name (git-file-name name version))
        (sha256
          (base32 "07kg1wkv0dhxj8a1xfzj2dnwsp232vd16n1j6jyxs0vvcqqbg5jj")
        )
      )
    )
    (inputs 
      (modify-inputs (package-inputs neovim)
        (append utf8proc)
      )
    )
  )
)

