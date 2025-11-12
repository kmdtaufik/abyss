{pkgs, ...}: let
  inherit (import ../../../settings.nix) theShell;
in {
  programs.fish = {
    enable = true;
    
    shellInit = ''
      #colorscheme
      source $__fish_config_dir/themes/tokyonight_storm.fish 
      # -----------------------------------------------------
      # Fastfetch
      # -----------------------------------------------------
      fastfetch --config examples/13

    '';
  };
  xdg.configFile."fish/themes"={
    source = ./themes;
    recursive = true;
  };
  programs.starship.enableFishIntegration = true;
  programs.zoxide.enableFishIntegration = true;
}
