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
    bat
    lazygit
    networkmanagerapplet
    android-tools
    ouch
    ntfs3g
    localsend
    mission-center
    inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs = {
    kdeconnect.enable = true;
    dconf.enable = true;
    seahorse.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
      # withUWSM = true;
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
