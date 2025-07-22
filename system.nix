{
  inputs,
  config,
  pkgs,
  username,
  hostname,
  ...
}: let
  inherit
    (import ./settings.nix)
    theLocale
    theTimezone
    gitUsername
    theShell
    theLCVariables
    theKBDLayout
    flakeDir
    ;
in {
  imports = [
    ./hardware.nix
    ./modules/system/
  ];

  # Enable networking
  networking.hostName = "${hostname}"; # Define your hostname
  networking.networkmanager.enable = true;

  # Set your time zone
  time.timeZone = "${theTimezone}";

  # Select internationalisation properties
  i18n.defaultLocale = "${theLocale}";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "${theLCVariables}";
    LC_IDENTIFICATION = "${theLCVariables}";
    LC_MEASUREMENT = "${theLCVariables}";
    LC_MONETARY = "${theLCVariables}";
    LC_NAME = "${theLCVariables}";
    LC_NUMERIC = "${theLCVariables}";
    LC_PAPER = "${theLCVariables}";
    LC_TELEPHONE = "${theLCVariables}";
    LC_TIME = "${theLCVariables}";
  };

  console.keyMap = "${theKBDLayout}";
  # Define a user account.
  users = {
    #defaultUserShell = pkgs."${theShell}";
    mutableUsers = true;
    users."${username}" = {
      homeMode = "755";
      hashedPassword = "$6$Cb1najBbswhf2rtK$0X6lDYzTIzKBrmr.9fMChgAUOglY7QGXAHtsV6k5vDvdcgnE6.9IIAwCab6vC/58Ap0L0qSGtIWZA3JO73g2D0";
      isNormalUser = true;
      description = "${gitUsername}";
      extraGroups = [
        "networkmanager"
        "wheel"
        "adbusers"
        "libvirtd"
        "kvm"
      ];
      shell = pkgs."${theShell}";
      ignoreShellProgramCheck = true;
      packages = with pkgs; [];
    };
  };

  environment.variables = {
    FLAKE = "${flakeDir}";
    # POLKIT_BIN = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  };

  # Optimization settings and garbage collection automation
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  system.stateVersion = "23.11";
}
