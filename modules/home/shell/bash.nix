{
  pkgs,
  config,
  ...
}: let
  inherit (import ../../../settings.nix) theShell;
in {
  programs.bash = {
    enable = true;
    initExtra = ''
      # We map ALL command types to Kryptonite Green (base0B) so 'echo', 'ls', and aliases look the same.
      ble-face -s command_builtin fg=#${config.lib.stylix.colors.base0B}
      ble-face -s command_alias fg=#${config.lib.stylix.colors.base0B}
      ble-face -s command_function fg=#${config.lib.stylix.colors.base0B}
      ble-face -s command_keyword fg=#${config.lib.stylix.colors.base0E} # Keywords like 'if/then' (Purple)

      # 2. ARGUMENTS & OPTIONS
      # 'argument_option' covers flags like -h or --help
      ble-face -s argument_option fg=#${config.lib.stylix.colors.base0A}

      # 'argument_error' covers invalid flags
      ble-face -s argument_error fg=#${config.lib.stylix.colors.base08},bold

      # 3. FILENAMES (Most arguments are files)
      # The manual lists 'filename_directory', 'filename_link', etc.
      # We make standard filenames Neon Cyan (base0C) to satisfy your request.
      ble-face -s filename_directory underline,fg=#${config.lib.stylix.colors.base0D}
      ble-face -s filename_executable underline,fg=#${config.lib.stylix.colors.base0B}
      ble-face -s filename_link underline,fg=#${config.lib.stylix.colors.base0C}
      ble-face -s filename_other underline,fg=#${config.lib.stylix.colors.base0C} # General arguments/files

      # 4. EXTRAS
      # Autosuggestions (The "Ghost Text")
      ble-face -s auto_complete fg=#${config.lib.stylix.colors.base03},italic

      # Selection Highlighting
      ble-face -s region bg=#${config.lib.stylix.colors.base02},fg=#${config.lib.stylix.colors.base05}
      # -----------------------------------------------------
        # Fastfetch
        # -----------------------------------------------------
        if [[ $(tty) == *"pts"* ]]; then
            fastfetch --config examples/13
        fi
    '';
  };
  programs.starship.enableBashIntegration = true;
  programs.zoxide.enableBashIntegration = true;
}
