{pkgs, ...}: {
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
  ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  programs = {
    fuse.userAllowOther = true;
    mtr.enable = true;
  };
}
