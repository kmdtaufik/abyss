{inputs, ...}: {
  imports = [
    inputs.walker.homeManagerModules.default
  ];

  programs.walker = {
    enable = true;
    runAsService = true;
    config = {
      providers.prefixes = [
        {
          provider = "clipboard";
          prefix = ":";
        }
        {
          provider = "calc";
          prefix = "=";
        }
        {
          provider = "files";
          prefix = "/";
        }
        {
          provider = "symbols";
          prefix = ".";
        }
        {
          provider = "runner";
          prefix = ">";
        }
        {
          provider = "websearch";
          prefix = "@";
        }
        {
          provider = "providerlist";
          prefix = ";";
        }
      ];
      keybinds.quick_activate = ["F1" "F2" "F3"];
    };
    # If this is not set the default styling is used.
    # theme.style =
    #   /*
    #   css
    #   */
    #   ''
    #     * {
    #       color: #dcd7ba;
    #     }
    #   '';
  };
}
