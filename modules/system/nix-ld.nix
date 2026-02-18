{pkgs,...}:{
programs.nix-ld.enable = true;
programs.nix-ld.libraries = with pkgs; [
  # The "Big Three" required by almost everything
  stdenv.cc.cc.lib  # libstdc++ (needed by anything C/C++)
  zlib              # compression lib (needed by Python/Node binaries)
  openssl           # crypto (needed by almost everything)
  
  # Common requirements for LSPs
  curl
  glib
  icu
  libunwind
  libuuid
  util-linux
];
  }
