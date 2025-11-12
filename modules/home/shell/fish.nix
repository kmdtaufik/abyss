{pkgs, ...}: let
  inherit (import ../../../settings.nix) theShell;
in {
  programs.fish = {
    enable = true;
    
    shellAbbrs = {
      ga = "git add .";
      gc = "git commit -m ";
      gco = "git checkout ";
      gp = "git push ";
      gpl = "git pull ";
      gd = "git diff ";
      gb = "git branch ";
    };
    functions = {
      fish_greeting = {
        body = ''
          #colorscheme
          source $__fish_config_dir/themes/tokyonight_storm.fish 
          # -----------------------------------------------------
          # Fastfetch
          # -----------------------------------------------------
          fastfetch --config examples/13
        '';
      };
    };
    shellInit = '''';

  };
  xdg.configFile."fish/themes"={
    source = ./themes;
    recursive = true;
  };
  programs.starship.enableFishIntegration = true;
  programs.zoxide.enableFishIntegration = true;
}
