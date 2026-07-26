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
  home.packages = with pkgs; [
    inputs.nix4adspower.packages.${pkgs.stdenv.hostPlatform.system}.default
    httptoolkit
  ];
}
