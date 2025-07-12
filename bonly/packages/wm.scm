(define-module (bonly packages wm)
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
  #:use-module (bonly packages admin)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages image)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
)

(define-public wlroots-0.19
  (package
    (inherit wlroots)
    (name "wlroots")
    (version "0.19.0")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
               (url "https://gitlab.freedesktop.org/wlroots/wlroots")
               (commit version)))
        (file-name (git-file-name name version))
        (sha256
          (base32 "1fa4gi2c6iil4k0xmqf2jx1apqg3pk0r4lrf23blpfiz439zkk13"))))
    (build-system meson-build-system)
    (arguments
      (list #:phases
            #~(modify-phases %standard-phases
                  (add-before 'configure 'hardcode-paths
                      (lambda* (#:key inputs #:allow-other-keys)
                          (substitute* "xwayland/server.c"
                              (("Xwayland")
                                (search-input-file inputs "bin/Xwayland")))))
                  (add-before 'configure 'fix-meson-file
                      (lambda* (#:key native-inputs inputs #:allow-other-keys)
                          (substitute* "backend/drm/meson.build"
                              (("/usr/share/hwdata/pnp.ids")
                               (search-input-file
                                 (or native-inputs inputs) "share/hwdata/pnp.ids"))))))))
    (propagated-inputs
      (list
        eudev
        libdisplay-info
        libinput-minimal
        libxkbcommon
        mesa
        pixman
        lcms
        libseat
        vulkan-headers
        vulkan-loader
        wayland
        wayland-protocols
        xcb-util-errors
        xcb-util-wm
        xorg-server-xwayland))
    (native-inputs
      (cons*
        pixman
        glslang
        hwdata
        pkg-config
        wayland
        (if (%current-target-system)
          (list pkg-config-for-build)
          '())))
    (home-page "https://gitlab.freedesktop.org/wlroots/wlroots/")
    (synopsis "bonly build wlroots")
    (description "bonly build new version for wlroots.")
    (license license:expat)))



