{ pkgs, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      emacs-mac = prev.callPackage ../packages/emacs-mac {
        withMacport = true;

        gconf = null;

        inherit (prev.darwin.apple_sdk.frameworks)
          AppKit Carbon Cocoa IOKit OSAKit Quartz QuartzCore UniformTypeIdentifiers WebKit
          ImageCaptureCore GSS ImageIO;
        inherit (prev.darwin) libobjc sigtool;
      };
    })
  ];
}
