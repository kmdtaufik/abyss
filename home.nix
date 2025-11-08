{
  config,
  pkgs,
  inputs,
  username,
  packages,
  ...
}: let
  inherit
    (import ./settings.nix)
    ;
in {
  # Home Manager Settings
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "25.11";
  # Set The Colorscheme
  # colorScheme = inputs.nix-colors.colorSchemes."${theme}";

  # Import Program Configurations
  imports = [
    #inputs.nix-colors.homeManagerModules.default
    inputs.hyprland.homeManagerModules.default
    ./modules/home
  ];

  # Define Settings For Xresources
  # xresources.properties = {
  #"Xcursor.size" = 24;
  #};

  # Create XDG Dirs
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  #dconf.settings = {
  #"org/virt-manager/virt-manager/connections" = {
  # autoconnect = [ "qemu:///system" ];
  # uris = [ "qemu:///system" ];
  #};
  #};
  # Install Packages For The User
  home.packages = with pkgs; [
    google-chrome
    imagemagick
    alacritty
    grim
    grimblast
    guvcview
    slurp
    nautilus
    nautilus-open-any-terminal
    imv
    mpv
    pavucontrol
    tree
    tldr
    ffmpeg
    zip
    trash-cli
    jp2a
    alejandra
    cliphist
    superfile
    discord
    ghostty
    nwg-look
    smile
    nwg-displays
    libadwaita
    adwaita-icon-theme
    adwaita-qt
    adwaita-qt6
    glib
    qt6.qtwayland
    qt5.qtwayland
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qtsvg
    qt6.qttools
    duf
    ncdu
    libreoffice
    croc
    papers
  ];
  programs = {
    gh.enable = true;
    fzf.enable = true;
    obsidian.enable = true;
  };
  programs.home-manager.enable = true;
  services.kdeconnect.enable = false;
}
