{inputs, pkgs,...}:   
let
     spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in{
  imports = [
    # Example for NixOS
    inputs.spicetify-nix.homeManagerModules.spicetify 
  ];
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
       adblockify
       hidePodcasts
       shuffle # shuffle+ (special characters are sanitized out of extension names)
     ];
  };
  stylix.targets.spicetify.enable = true;
}
