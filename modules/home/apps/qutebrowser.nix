{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkIf config.modules.qutebrowser.enable {
    programs.qutebrowser = {
      enable = true;
      extraConfig = ''
        import os
        noctalia_theme = os.path.expanduser('~/.config/qutebrowser/noctalia.py')
        if os.path.exists(noctalia_theme):
            with open(noctalia_theme) as f:
                exec(f.read())
      '';
    };
  };
}
