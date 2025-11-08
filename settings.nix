# PLEASE READ THE WIKI FOR DETERMINING
# WHAT TO PUT HERE AS OPTIONS.
# https://gitlab.com/Zaney/zaneyos/-/wikis/Setting-Options
let
  # THINGS YOU NEED TO CHANGE
  username = "kdx";
  userHome = "/home/${username}";
  flakeDir = "${userHome}/zicronos";
in {
  #Abyss
  cache-dir = "$HOME/.cache/abyss";

  #Screenshot
  screenshot-folder = "$HOME/Pictures/Screenshots";
  screenshot-editor = "pinta";
  screenshot-name = "screenshot_$(date +%d%m%Y_%H%M%S).jpg";

  # User Variables
  username = "${username}";
  userHome = "${userHome}";
  hostname = "nixos";
  system = "x86_64-linux";

  gitUsername = "MD TAUFIK KHAN";
  gitEmail = "147173391+kmdtaufikx@users.noreply.github.com";
  browser = "firefox";
  # ^ (use as is or replace with your own repo - removing will break the wallsetter script)
  wallpaperDir = "${userHome}/wallpapers";
  flakeDir = "${flakeDir}";
  terminal = "kitty"; # This sets the terminal that is used by the hyprland terminal keybinding

  # System Settings
  clock24h = true;
  theLocale = "en_US.UTF-8";
  theKBDLayout = "us";
  theSecondKBDLayout = "de"; # Default is empty or de
  theKBDVariant = "";
  theLCVariables = "en_GB.UTF-8";
  theTimezone = "Asia/Dhaka";
  theShell = "nushell"; # Possible options: bash, zsh, nushell
  theKernel = "zen"; # Possible options: default, latest, lqx, xanmod, zen
  sdl-videodriver = "wayland"; # Either x11 or wayland ONLY. Games might require x11 set here
  # For Hybrid Systems intel-nvidia

  # Nvidia Hybrid Devices
  # ONLY NEEDED FOR HYBRID
  # SYSTEMS!
  intel-bus-id = "PCI:1:0:0";
  nvidia-bus-id = "PCI:0:2:0";

  # Enable / Setup NFS
  nfs = false;
  nfsMountPoint = "/mnt/nas";
  nfsDevice = "nas:/volume1/nas";

  # NTP & HWClock Settings
  ntp = true;
  localHWClock = false;
}
