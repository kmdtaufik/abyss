# PLEASE READ THE WIKI FOR DETERMINING
# WHAT TO PUT HERE AS OPTIONS.
# https://gitlab.com/Zaney/zaneyos/-/wikis/Setting-Options
let
  # THINGS YOU NEED TO CHANGE
  username = "devshadow";
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
  gitUsername = "008";
  gitEmail = "147173391+xeroxero8x@users.noreply.github.com";
  theme = "tokyo-night-dark";
  browser = "firefox";
  # ^ (use as is or replace with your own repo - removing will break the wallsetter script)
  wallpaperDir = "${userHome}/wallpapers";
  screenshotDir = "${userHome}/Pictures/Screenshots";
  flakeDir = "${flakeDir}";
  flakePrev = "${userHome}/.zicronos-previous";
  flakeBackup = "${userHome}/.zicronos-backup";
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
  # Should Be Used As gpuType
  cpuType = "intel";
  gpuType = "intel";

  #Config Settings
  # configDirectory = "${userHome}/abyss/home/config";

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

  # Enable Printer & Scanner Support
  printer = false;

  # Enable Flatpak & Larger Programs
  distrobox = false;
  flatpak = false;
  kdenlive = false;
  blender = false;
  # Enable Support For
  # Logitech Devices
  logitech = false;

  # Enable Python & PyCharm
  python = false;

  # Enable SyncThing
  syncthing = false;

  # Enable Kde Connetc
  kdeconnect = false;
}
