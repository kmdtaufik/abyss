{username, inputs, ...}: {
  # Home Manager Settings
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";

  # Import Program Configurations
  imports = [
    ./modules/home
    inputs.nix-index-database.homeModules.default
  ];

  modules = {
    alacritty.enable = true;
    dropTerm.enable = true;
    cliphist.enable = true;
    devsuite.enable = false;
    direnv.enable = true;
    git.enable = true;
    gh.enable = true;
    fzf.enable = true;
    obsidian.enable = true;
    obs.enable = true;
    gtk.enable = true;
    hyprland.enable = false;
    niri.enable = true;
    noctalia.enable = true;
    kitty.enable = true;
    ghostty.enable = true;
    foot.enable = true;
    nvim.enable = true;
    qt.enable = true;
    qutebrowser.enable = false;
    rofi.enable = true;
    ssh.enable = true;
    starship.enable = true;
    stylix.enable = true;
    swappy.enable = true;
    swaync.enable = false;
    waybar.enable = false;
    wlogout.enable = false;
    xsettingsd.enable = true;
    zen.enable = true;
    zoxide.enable = true;
    matugen.enable = false;
    pywal.enable = false; # matugen regenerates ~/.cache/wal compat outputs
    bash.enable = true;
    fish.enable = true;
    awww.enable = false;
  };

  programs = {
    home-manager.enable = true;
    nix-index-database.comma.enable = true;
  };
}
