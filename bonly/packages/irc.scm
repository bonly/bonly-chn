(define-module (bonly packages irc)
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
               #:use-module (gnu packages admin)
               #:use-module (gnu packages vulkan)
               #:use-module (gnu packages xorg)
               #:use-module (gnu packages pciutils)
               #:use-module (gnu packages pkg-config)
               #:use-module (gnu packages image)
               #:use-module (guix gexp)
               #:use-module (guix git-download)
               #:use-module (guix utils)
               #:use-module (gnu packages irc)
               )

(define-public weechat-local
               (package/inherit weechat
                 (version "4.6.3")
                 (name "weechat-local")
                 (arguments
                   (substitute-keyword-arguments (package-arguments weechat)
                                                 ((#:configure-flags flags)
                                                  `(cons* "-DENABLE_GUILE=OFF" "-DENABLE_LUA=OFF"
                                                          "-DENABLE_RUBY=OFF" "-DENABLE_TCL=OFF" ,flags))))
                 (inputs
                   (modify-inputs (package-inputs weechat)
                                  (delete "guile-3.0" "lua-5.1" "ruby" "tcl")))))

