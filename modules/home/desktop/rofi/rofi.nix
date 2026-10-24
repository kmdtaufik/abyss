{
  config,
  lib,
  pkgs,
  ...
}: let
  colors = config.lib.stylix.colors;
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  config = lib.mkIf config.modules.rofi.enable {
    programs.rofi = {
      enable = true;
      theme = {
        "*" = {
          background = mkLiteral "#${colors.base00}E6";
          foreground = mkLiteral "#${colors.base05}";
          primary = mkLiteral "#${colors.base0D}";
          background-alt = mkLiteral "#${colors.base01}E6";
          border-color = mkLiteral "@primary";
          text-color = mkLiteral "@foreground";
          background-color = mkLiteral "transparent";
        };
        "window" = {
          width = mkLiteral "40%";
          border-radius = mkLiteral "12px";
          border = mkLiteral "2px solid";
          padding = mkLiteral "10px";
          background-color = mkLiteral "@background";
        };
        "mainbox" = {
          children = map mkLiteral [ "inputbar" "listview" ];
        };
        "inputbar" = {
          children = map mkLiteral [ "prompt" "entry" ];
          background-color = mkLiteral "@background-alt";
          border-radius = mkLiteral "8px";
          padding = mkLiteral "10px";
          margin = mkLiteral "0px 0px 10px 0px";
        };
        "prompt" = {
          padding = mkLiteral "0px 10px 0px 0px";
          text-color = mkLiteral "@primary";
        };
        "entry" = {
          placeholder = "Search...";
          text-color = mkLiteral "@foreground";
        };
        "listview" = {
          lines = 8;
          columns = 1;
          fixed-height = true;
          spacing = mkLiteral "4px";
        };
        "element" = {
          padding = mkLiteral "8px 10px";
          border-radius = mkLiteral "8px";
        };
        "element selected" = {
          background-color = mkLiteral "@primary";
          text-color = mkLiteral "@background";
        };
        "element-text" = {
          vertical-align = mkLiteral "0.5";
          text-color = mkLiteral "inherit";
        };
        "element-icon" = {
          size = mkLiteral "24px";
          margin = mkLiteral "0px 10px 0px 0px";
        };
      };
      extraConfig = {
        modi = "drun,run,filebrowser";
        show-icons = true;
        display-drun = "Apps";
        display-run = "Run";
        display-filebrowser = "Files";
        drun-display-format = "{name}";
      };
    };
    stylix.targets.rofi.enable = false;
  };
}
