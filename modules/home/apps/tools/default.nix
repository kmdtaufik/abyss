{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./btop.nix
    ./fastfetch.nix
    ./nh.nix
  ];
  home.packages = [
    inputs.nix4adspower.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
