{
  pkgs,
  config,
  inputs,
  ...
}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.android_sdk.accept_license = true;

  # List System Programs
  environment.systemPackages = with pkgs; [
    jq
    wget
    curl
    git
    htop
    btop
    libvirt
    lm_sensors
    unzip
    unrar
    libnotify
    p7zip
    v4l-utils
    ydotool
    wl-clipboard
    socat
    lshw
    pkg-config
    meson
    gnumake
    ninja
    noto-fonts-color-emoji
    material-icons
    brightnessctl
    toybox
    ripgrep
    appimage-run
    libgcc
    yad
    playerctl
    nh
    bat
    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland
    qt6Packages.qt6ct
    lazygit
    networkmanagerapplet
  ];

  programs = {
    dconf.enable = true;
    adb.enable = true;
    seahorse.enable = false;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
      withUWSM = true;
    };
    fuse.userAllowOther = true;
    mtr.enable = true;
    # gnupg.agent = {
    #   enable = false;
    #   enableSSHSupport = false;
    # };
    virt-manager.enable = false;
  };

  virtualisation.libvirtd.enable = false;
  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
}
