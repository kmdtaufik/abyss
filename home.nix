{username, ...}: {
  # Home Manager Settings
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";

  # Import Program Configurations
  imports = [
    ./modules/home
  ];

  modules = {
    alacritty.enable = true;
    dropTerm.enable = true;
    btop.enable = true;
    cliphist.enable = true;
    devsuite.enable = true;
    direnv.enable = true;
    fastfetch.enable = true;
    git.enable = true;
    gh.enable = true;
    fzf.enable = true;
    obsidian.enable = true;
    gtk.enable = true;
    hyprland.enable = true;
    kitty.enable = true;
    nh.enable = true;
    nvim.enable = true;
    qt.enable = true;
    qutebrowser.enable = false;
    rofi.enable = true;
    ssh.enable = true;
    starship.enable = true;
    stylix.enable = true;
    swappy.enable = true;
    swaync.enable = true;
    walker.enable = true;
    waybar.enable = true;
    xsettingsd.enable = true;
    zen.enable = true;
    zoxide.enable = true;
    matugen.enable = true;
    pywal.enable = true;
    abyss.enable = true;
    bash.enable = true;
    fish.enable = true;
  };

  programs.home-manager.enable = true;
}
