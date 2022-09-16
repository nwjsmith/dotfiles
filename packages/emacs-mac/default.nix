let
  macportVersion = "8.3";
in import ./generic.nix (rec {
  version = "27.2";
  sha256 = "sha256-tKfMTnjmPzeGJOCRkhW5EK9bsqCvyBn60pgnLp9Awbk=";
  patches = fetchpatch: [
    (fetchpatch {
      name = "fix-aarch64-darwin-triplet.patch";
      url = "https://git.savannah.gnu.org/cgit/emacs.git/patch/?id=a88f63500e475f842e5fbdd9abba4ce122cdb082";
      sha256 = "sha256-RF9b5PojFUAjh2TDUW4+HaWveV30Spy1iAXhaWf1ZVg=";
    })
  ];
  inherit macportVersion;
  macportPatches = builtins.fetchTarball {
    url = "ftp://ftp.math.s.chiba-u.ac.jp/emacs/emacs-${version}-mac-${macportVersion}.tar.gz";
    sha256 = "1db7z2g33s58nriqcvqdahry9rvdn88cibmiprg66094yqfv4fnk";
  };
})
