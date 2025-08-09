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
  home.stateVersion = "23.11";
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

  # Install & Configure Git
  # programs.git = {
  #   enable = true;
  #   signing.key = "0292F1A141E88790";
  #   # userName = "${gitUsername}";
  #   # userEmail = "${gitEmail}";
  #   signing.signByDefault = false;
  # };

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
    vivaldi
    google-chrome
    gnupg
    pinentry-all
    ags
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
    libreoffice-collabora
    github-desktop
    zoom-us
    superfile
    peazip
    discord
    ghostty
    localsend
    nwg-look
    smile
    nwg-displays
    vesktop
    chromium
    libadwaita
    adwaita-icon-theme
    adwaita-qt
    adwaita-qt6
    glib
    qt6.qtwayland
    qt5.qtwayland
    onlyoffice-bin
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qtsvg
    qt6.qttools
    #inputs.quickshell.packages.x86_64-linux.default
    duf
    ncdu
    material-symbols
    mongodb-atlas-cli
  ];
  programs = {
    gh.enable = true;
    fzf.enable = true;
  };
  programs.home-manager.enable = true;
  services.kdeconnect.enable = true;
}
